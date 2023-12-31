import 'package:cashcalculator/model/ip_phone_model.dart';
import 'package:flutter/material.dart';

class IpNumber extends StatefulWidget {
  const IpNumber({super.key});

  @override
  State<IpNumber> createState() => _IpNumberState();
}

class _IpNumberState extends State<IpNumber> {
  // TextEditingController controllerSearch = TextEditingController();

  List results = [];

  var datalist = [];

  String query = '';
  TextEditingController tc = TextEditingController();

  @override
  void initState() {
    super.initState();
    tc;

    datalist = IpModel.ipDataList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "IP Number",
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
                        hintText: 'Search Deparetment or Ip Number',
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
                                shadowColor: Colors.pink,
                                child: ListTile(
                                  title: Text(
                                      "Department: ${datalist[ind]['Department']}"),
                                  // ignore: prefer_interpolation_to_compose_strings
                                  subtitle: Text(
                                      'IpNumber :  ${datalist[ind]['IpNumber']}',
                                      style: const TextStyle(
                                          fontSize: 18, color: Colors.purple)),
                                  onTap: () {
                                    setState(() {
                                      tc.text = datalist[ind]['Department'];
                                      query = datalist[ind]['Department'];
                                      setResults(query);
                                    });
                                  },
                                ),
                              );
                            },
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: results.length,
                            itemBuilder: (con, ind) {
                              return ListTile(
                                title: Text(
                                  'Department :  ${results[ind]['Department']}',
                                  style: const TextStyle(fontSize: 20),
                                ),

                                subtitle: Text(
                                  'Ip Number :  ${results[ind]['IpNumber']}',
                                  style: const TextStyle(
                                      fontSize: 18, color: Colors.blue),
                                ),

                                //   trailing:  Text(results[ind]['Sl'].toString()),

                                onTap: () {
                                  setState(() {
                                    tc.text = results[ind]['Department'];
                                    query = results[ind]['Department'];
                                    query = results[ind]['IpNumber'].toString();
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
            elem['Department']
                .toString()
                .toLowerCase()
                .contains(query.toLowerCase()) ||
            elem['IpNumber']
                .toString()
                .toLowerCase()
                .contains(query.toLowerCase()))
        .toList();
  }
}
