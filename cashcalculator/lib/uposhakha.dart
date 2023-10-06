// ignore_for_file: avoid_print, prefer_const_literals_to_create_immutables, prefer_const_constructors, body_might_complete_normally_nullable

import 'package:cashcalculator/model/uposhakha_model.dart';
import 'package:flutter/material.dart';

class Uposhakha extends StatefulWidget {
  const Uposhakha({super.key});

  @override
  State<Uposhakha> createState() => _UposhakhaState();
}

class _UposhakhaState extends State<Uposhakha> {
  TextEditingController controllerSearch = TextEditingController();

  List results = [];

  var datalist = [];

  String query = '';
  TextEditingController tc = TextEditingController();

  @override
  void initState() {
    super.initState();
    tc;

    datalist = UposhakhaModel.datalist;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Uposhakha List",
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
                        hintText: 'Search Branch Name Or Branch Code ...',
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
                                      'BranchName :  ${datalist[ind]['Branch_Name']}'),
                                  subtitle: Text(
                                      'BranchCode :  ${datalist[ind]['Code']}'),
                                  trailing: Text(datalist[ind]
                                          ['Branch_Mnemonic']
                                      .toString()),
                                  onTap: () {
                                    setState(() {
                                      tc.text = datalist[ind]['Branch_Name'];
                                      query = datalist[ind]['Branch_Name'];
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
                                  'BranchName :  ${results[ind]['Branch_Name']}',
                                  style: const TextStyle(
                                      fontSize: 20, color: Colors.deepOrange),
                                ),

                                subtitle: Text(
                                  'Branch Code :  ${results[ind]['Code']}',
                                  style: TextStyle(color: Colors.green[800]),
                                ),
                                trailing: Text(
                                  'Branch Numeric :  ${results[ind]['Branch_Mnemonic']}',
                                  style: TextStyle(color: Colors.pink[800]),
                                ),

                                //   trailing:  Text(results[ind]['Sl'].toString()),

                                onTap: () {
                                  setState(() {
                                    tc.text = results[ind]['Branch_Name'];
                                    query = results[ind]['Branch_Name'];
                                    query = results[ind]['Code'].toString();
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
            elem['Branch_Name']
                .toString()
                .toLowerCase()
                .contains(query.toLowerCase()) ||
            elem['Code'].toString().contains(query) ||
            elem['Branch_Mnemonic']
                .toString()
                .toLowerCase()
                .contains(query.toLowerCase()))
        .toList();
  }
}
  




//  Column(
//             children: [
//               ListView.builder(
//                   scrollDirection: Axis.vertical,
//                   shrinkWrap: true,
//                   itemCount: _data.length,
//                   itemBuilder: (_, index) {
//                     return Card(
//                       elevation: 3,
//                       shadowColor: Colors.black,
//                       margin: const EdgeInsets.all(3),
//                       color: index == 0 ? Colors.amber : Colors.blue,
//                       child: ListTile(
//                         leading: Text(_data[index][0].toString()),
//                         title: Text(_data[index][1].toString()),
//                         trailing: Text(_data[index][2].toString()),
//                       ),
//                     );
//                   })
//             ],
//           ),
