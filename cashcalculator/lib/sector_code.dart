import 'package:cashcalculator/model/sector_code_model.dart';
import 'package:flutter/material.dart';

class SectorCode extends StatefulWidget {
  const SectorCode({super.key});

  @override
  State<SectorCode> createState() => _SectorCodeState();
}

class _SectorCodeState extends State<SectorCode> {
  TextEditingController controllerSearch = TextEditingController();

  List results = [];

  var datalist = [];

  String query = '';
  TextEditingController tc = TextEditingController();

  @override
  void initState() {
    super.initState();
    tc;

    datalist = SectorCodeModel.sectorDataList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Sector Code",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(10),
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: tc,
                    decoration: InputDecoration(
                        hintText: 'Sector Name Or Sector Code ...',
                        hintStyle: TextStyle(color: Colors.pink[200])),
                    onChanged: (v) {
                      setState(() {
                        query = v.toString();
                        setResults(query);
                      });
                    },
                  ),
                ),
               
                Expanded(
                  child: Card(
                    elevation: 3,
                    shadowColor: Colors.blue,
                    color: Colors.white,
                    child: query.isEmpty
                        ? ListView.builder(
                            shrinkWrap: true,
                            itemCount: datalist.length,
                            itemBuilder: (con, ind) {
                              return Card(
                                elevation: 3,
                                shadowColor: Colors.cyan,
                                child: ListTile(
                                  title: Text(
                                      datalist[ind]['sectorName'].toString()),
                                  subtitle: Text(
                                      datalist[ind]['sectorCode'].toString(),
                                      style: const TextStyle(
                                          fontSize: 18, color: Colors.amber)),
                                  onTap: () {
                                    setState(() {
                                      tc.text = datalist[ind]['sectorName'];
                                      query = datalist[ind]['sectorName'];
                                      setResults(query);
                                    });
                                  },
                                ),
                              );
                            },
                          )

                        //
                        //    "Sl": 659,
                        //    "BranchName": "Arambagh Uposhakha  Dhaka",
                        //    "Code": 7206

                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: results.length,
                            itemBuilder: (con, ind) {
                              return ListTile(
                                title: Text(
                                  results[ind]['sectorName'].toString(),
                                  style: const TextStyle(fontSize: 20),
                                ),

                                subtitle: Text(
                                  results[ind]['sectorCode'].toString(),
                                  style: const TextStyle(
                                      fontSize: 18, color: Colors.blue),
                                ),

                                //   trailing:  Text(results[ind]['Sl'].toString()),

                                onTap: () {
                                  setState(() {
                                    tc.text = results[ind]['sectorName'];
                                    query = results[ind]['sectorName'];
                                    query =
                                        results[ind]['sectorCode'].toString();
                                    setResults(query);
                                  });
                                },
                              );
                            },
                          ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void setResults(String query) {
    results = datalist
        .where((elem) =>
            elem['sectorName']
                .toString()
                .toLowerCase()
                .contains(query.toLowerCase()) ||
            elem['sectorCode'].toString().contains(query))
        .toList();
  }
}
