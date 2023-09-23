import 'dart:io';

import 'package:cashcalculator/cp.dart';
import 'package:cashcalculator/dps.dart';
import 'package:cashcalculator/emi_calculator.dart';
import 'package:cashcalculator/fdr.dart';
import 'package:cashcalculator/ipnumber.dart';
import 'package:cashcalculator/routingnumber.dart';

import 'package:cashcalculator/sector_code.dart';
import 'package:cashcalculator/uposhakha.dart';
import 'package:cashcalculator/widget/custom%20button.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DateTime timeBackPressed = DateTime.now();
  bool closeAppUsingExit() {
    exit(0);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final difference = DateTime.now().difference(timeBackPressed);
        final isExitWarnning = difference >= const Duration(seconds: 2);
        timeBackPressed = DateTime.now();
        if (isExitWarnning) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(" Press Again to exit"),
          ));
          return false;
        } else {
          // Navigator.of(context).pop(true);
          return closeAppUsingExit();
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 30, right: 10, left: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return const AlertDialog(
                                    title: Text("Disclaimer"),
                                    content: Text(
                                        "All information in the Service is provided as is, with no guarantee of completeness, accuracy, timeliness or of the results obtained from the use of this information. This App use own risk ."),
                                  );
                                });
                          },
                          icon: const Icon(Icons.info_outline)),
                    ],
                  ),
                  const Text(
                    " Choose Your Option! ",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Colors.orange,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  customButton('Cash Calculator', () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => const Cp()));
                  }),
                  const SizedBox(
                    height: 20,
                  ),
                  customButton("FDR Calculator", () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const Fdr()));
                  }),
                  const SizedBox(
                    height: 20,
                  ),
                  customButton("DPS Calculator", () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const DpsCalculator()));
                  }),
                  const SizedBox(
                    height: 20,
                  ),
                  customButton("EMI Loan Calculator", () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const EMICalculator()));
                  }),
                  const SizedBox(
                    height: 20,
                  ),
                  customButton("Routing Number", () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const RoutingNumber()));
                  }),
                  const SizedBox(
                    height: 20,
                  ),
                  customButton("Sector Code", () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const SectorCode()));
                  }),
                  const SizedBox(
                    height: 20,
                  ),
                  customButton("IP Number", () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const IpNumber()));
                  }),
                  const SizedBox(
                    height: 20,
                  ),
                  customButton("Uposhakha List", () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const Uposhakha()));
                  }),
                  const SizedBox(
                    height: 80,
                  ),
                  Center(
                    child: Text(
                      "Developed by MRH",
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: Colors.grey[800]),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      //
    );
  }

  // Future<bool> onWillPop() {}
}
