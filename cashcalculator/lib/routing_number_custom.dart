import 'package:cashcalculator/model/routing_model.dart';
import 'package:cashcalculator/model/routing_number_model.dart';
import 'package:cashcalculator/widget/custom%20button.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class RoutingNumberCustom extends StatefulWidget {
  const RoutingNumberCustom({super.key});

  @override
  State<RoutingNumberCustom> createState() => _RoutingNumberCustomState();
}

class _RoutingNumberCustomState extends State<RoutingNumberCustom> {
  TextEditingController tcBranchName = TextEditingController();

  List<String> districtList = RoutingListModel.districtList;
  List<String> bankList = RoutingListModel.bankList;

  String query = '';
  String query3 = '';
  String query4 = '';
  List results = [];
  var datalist = [];

  @override
  void initState() {
    super.initState();

    tcBranchName;

    datalist = RoutingModel.routingDataList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Custom Routing Number Search ",
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
                        customButton("Routing Number Search", () {
                          Navigator.pop(context);
                          tcBranchName.clear();
                          query = '';
                          query3 = '';
                          query4 = '';
                        }, Colors.green[100]),
                        const SizedBox(
                          height: 10,
                        ),
                        DropdownSearch<String>(
                          popupProps: const PopupProps.menu(
                            showSelectedItems: true,
                            //disabledItemFn: (String s) => s.startsWith('I'),
                          ),
                          items: bankList,
                          dropdownDecoratorProps: const DropDownDecoratorProps(
                            dropdownSearchDecoration: InputDecoration(
                              labelText: "Bank Name",
                              hintText: "Bank Name",
                            ),
                          ),
                          onChanged: (v) {
                            setState(() {
                              query = v.toString();
                              setResults(
                                  query: query, query3: query3, query4: query4);
                            });
                          },
                        ),
                        DropdownSearch<String>(
                          popupProps: const PopupProps.menu(
                            showSelectedItems: true,
                          ),
                          items: districtList,
                          dropdownDecoratorProps: const DropDownDecoratorProps(
                            dropdownSearchDecoration: InputDecoration(
                              labelText: "District",
                              hintText: "District",
                            ),
                          ),
                          onChanged: (v) {
                            setState(() {
                              query3 = v.toString();
                              setResults(
                                  query: query, query3: query3, query4: query4);
                            });
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: tcBranchName,
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              label: const Text("Input Branch Name"),
                              hintText: 'Input Branch Name',
                              hintStyle: TextStyle(color: Colors.pink[200])),
                          onChanged: (v) {
                            setState(() {
                              query4 = v.toString();
                              setResults(
                                  query: query, query3: query3, query4: query4);
                            });
                          },
                        ),
                      ],
                    )),
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
                                // "BankName": "AGRANI BANK LTD.",
                                // "DistName": "BAGERHAT",
                                // "BranchName": "BADHAL BAZAR",
                                // "RoutingNo": "010010048",
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
                                        style: const TextStyle(fontSize: 18)),
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
                                              color: Colors.blue,fontSize: 18)),
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
                                              color: Colors.red,fontSize: 18)),
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

  setResults({
    required query,
    required query3,
    required query4,
  }) {
    results = datalist.where((elem) {
      return elem['BankName']
              .toString()
              .toLowerCase()
              .contains(query.toLowerCase()) &&
          elem['DistName']
              .toString()
              .toLowerCase()
              .contains(query3.toLowerCase()) &&
          elem['BranchName']
              .toString()
              .toLowerCase()
              .contains(query4.toLowerCase());
    }).toList();
  }
}
