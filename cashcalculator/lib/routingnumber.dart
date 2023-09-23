import 'package:cashcalculator/model/routing_number_model.dart';
import 'package:cashcalculator/routing_number_custom.dart';
import 'package:cashcalculator/widget/custom%20button.dart';
import 'package:flutter/material.dart';

class RoutingNumber extends StatefulWidget {
  const RoutingNumber({super.key});

  @override
  State<RoutingNumber> createState() => _RoutingNumberState();
}

class _RoutingNumberState extends State<RoutingNumber> {
  List results = [];
  var datalist = [];

  String query2 = '';

  TextEditingController tc = TextEditingController();

  @override
  void initState() {
    super.initState();
    //tc;

    datalist = RoutingModel.routingDataList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Routing Number Search",
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
                    child: Column(
                      children: [
                        customButton("Custom Search", () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const RoutingNumberCustom()));
                          tc.clear();
                          setState(() {
                            //results;

                            query2 = '';
                          });
                        }, Colors.green[100]),

                        const SizedBox(
                          height: 10,
                        ),

                        TextField(
                          controller: tc,
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              label: const Text("Input Routing Number"),
                              hintText: 'Search With Routing Number',
                              hintStyle: TextStyle(color: Colors.pink[200])),
                          onChanged: (v) {
                            setState(() {
                              query2 = v.toString();
                              setRoutingNumber(query2);
                            });
                          },
                        ),
                        // const Text(
                        //   "Custom Search ",
                        //   style: TextStyle(fontSize: 20, color: Colors.cyan),
                        // ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    )),
                Expanded(
                  child: Card(
                    elevation: 3,
                    shadowColor: Colors.blue,
                    color: Colors.white,
                    child: query2.isEmpty
                        ? ListView.builder(
                            shrinkWrap: true,
                            itemCount: datalist.length,
                            itemBuilder: (con, ind) {
                              return Card(
                                elevation: 3,
                                shadowColor: Colors.pink,
                                child: Column(
                                  children: [
                                    Text(
                                        'Bank Name : ${datalist[ind]['BankName']}',
                                        style: const TextStyle(fontSize: 18)),
                                    Text(
                                        'Branch Name : ${datalist[ind]['BranchName']}'),
                                    Text(
                                        'District : ${datalist[ind]['DistName']}'),
                                    Text(
                                      'Routing No : ${datalist[ind]['RoutingNo']}',
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                  ],
                                ),
                              );
                            },
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: results.length,
                            itemBuilder: (con, ind) {
                              return Card(
                                elevation: 3,
                                shadowColor: Colors.pink,
                                child: Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: Column(
                                    children: [
                                      Text(
                                        'Bank Name : ${results[ind]['BankName']}',
                                        style: const TextStyle(
                                            color: Colors.blue, fontSize: 18),
                                      ),
                                      Text(
                                          'Branch Name : ${results[ind]['BranchName']}',
                                          style: const TextStyle(
                                              color: Colors.purple)),
                                      Text(
                                          'District : ${results[ind]['DistName']}',
                                          style: const TextStyle(
                                              color: Colors.cyan)),
                                      Text(
                                          'Routing No : ${results[ind]['RoutingNo']}',
                                          style: const TextStyle(
                                              color: Colors.red, fontSize: 18)),
                                    ],
                                  ),
                                ),
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

  void setRoutingNumber(String query2) {
    results = datalist
        .where((elem) => elem['RoutingNo']
            .toString()
            .toLowerCase()
            .contains(query2.toLowerCase()))
        .toList();
  }
}
