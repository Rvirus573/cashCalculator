// ignore_for_file: non_constant_identifier_names, unnecessary_null_comparison, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Fdr extends StatefulWidget {
  const Fdr({super.key});

  @override
  State<Fdr> createState() => _FdrState();
}

class _FdrState extends State<Fdr> {
  TextEditingController controllerAmount = TextEditingController();
  TextEditingController controllerInterest = TextEditingController();

  _getsizeboxed({required double hight, required double width}) {
    return SizedBox(
      height: hight,
      width: width,
    );
  }

  _getStyle(
      {required double size,
      required Color color,
      // ignore: avoid_types_as_parameter_names
      FontWeight = FontWeight.bold}) {
    return GoogleFonts.oswald(
        fontSize: size, fontWeight: FontWeight, color: color);
  }

  List<String> tenorList = ['3M', '6M', '1Y', '2Y', '3Y', '5Y', '10Y'];
  String? dropdownValue;

  num tenor_list_value = 0;
  int tin_Index = 0;
  num principel_Amout = 0;
  num interest_Rate = 0;
  num fdr_interest_1m = 0;

  String? result_1M = '0';
  String? result = '0';
  String? result_with_principal = '0';
  String? month = '';

  String? fdr_interest_1m_TW = '0';
  String? fdr_interest_1m_TX = '0';

  String? tw_month_tenor = '0';
  String? tx_month_tenor = '0';
  String? result_with_principal_TW = '0';
  String? result_with_principal_TX = '0';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 10, top: 10, left: 10),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text('FDR Calculator',
                        style: _getStyle(size: 35, color: Colors.red)),
                  ),
                  _getsizeboxed(hight: 15, width: 0),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: TextField(
                      controller: controllerAmount,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        label: Text('Fixed Deposit Amount',
                            style: GoogleFonts.roboto(
                                fontSize: 18,
                                color: Colors.pink[200],
                                fontWeight: FontWeight.bold)),
                        hintText: 'Type Here...',
                        hintStyle: GoogleFonts.openSans(fontSize: 25),
                      ),
                    ),
                  ),
                  _getsizeboxed(hight: 10, width: 0),
                  TextField(
                    controller: controllerInterest,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      label: Text('Interest Rate',
                          style: GoogleFonts.roboto(
                              fontSize: 18,
                              color: Colors.pink[200],
                              fontWeight: FontWeight.bold)),
                      hintText: "3M = 7.25% , 6M = 7.50%, 1Y/2Y/3Y = 7.75%.",
                      hintStyle: GoogleFonts.openSans(fontSize: 18),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 60,
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Colors.blue,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Column(
                        children: [
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Tenor :',
                                  style: TextStyle(
                                      fontSize: 35,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.purple[600]),
                                ),
                                _getsizeboxed(hight: 0, width: 20),
                                DropdownButton<String>(
                                  // Step 3.
                                  value: dropdownValue,
                                  hint: const Text(
                                    "Select",
                                    style: TextStyle(
                                        color: Colors.green, fontSize: 25),
                                  ),
                                  focusColor: Colors.pink[200],
                                  dropdownColor: Colors.white,
                                  // Step 4.
                                  items: tenorList
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: TextStyle(
                                            fontSize: 30,
                                            color: Colors.pink[200]),
                                      ),
                                    );
                                  }).toList(),
                                  // Step 5.
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropdownValue = newValue!;

                                      if (newValue == '3M') {
                                        tenor_list_value = 3;
                                        //  interest_Rate = 7.25;
                                        // fdrcalculate();
                                      } else if (newValue == '6M') {
                                        tenor_list_value = 6;
                                        // interest_Rate = 7.5;
                                        //  fdrcalculate();
                                      } else if (newValue == '1Y') {
                                        tenor_list_value = 12;
                                        // interest_Rate = 7.75;
                                        //  fdrcalculate();
                                      } else if (newValue == '2Y') {
                                        tenor_list_value = 24;
                                        //interest_Rate = 7.75;
                                        //fdrcalculate();
                                      } else if (newValue == '3Y') {
                                        tenor_list_value = 36;
                                      } else if (newValue == '5Y') {
                                        tenor_list_value = 60;
                                      } else if (newValue == '10Y') {
                                        tenor_list_value = 120;
                                      }
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: SizedBox(
                      width: 300,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink, // background
                          foregroundColor: Colors.orange, // foreground
                        ),
                        onPressed: () {
                          setState(() {
                            if (controllerAmount.text == "" ||
                                controllerInterest.text == "" ||
                                tenor_list_value == 0) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("Please Input Value"),
                              ));
                            } else {
                              fdrcalculate();
                              withoutTinCalculate();
                              withTinCalculate();
                              FocusManager.instance.primaryFocus!.unfocus();
                            }
                          });
                        },
                        child: const Text(
                          'Calculate',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    // height: 130,
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Colors.blue,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                "FDR Calculation",
                                style: TextStyle(
                                    color: Colors.purple[600],
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            // _getsizeboxed(hight: 10, width: 0),

                            Text(
                              "Interrest of 1M : $result_1M ",
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black),
                            ),
                            Text(
                              "Interrest of $month : $result",
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black),
                            ),
                            Text(
                              "Int. + Principle of $month : $result_with_principal",
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                // color: Colors.amber
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  withoutTin(),
                  const SizedBox(
                    height: 10,
                  ),
                  withTin(),
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }

  fdrcalculate() {
    month = dropdownValue;
    principel_Amout = num.parse(controllerAmount.text);
    interest_Rate = num.parse(controllerInterest.text);
    num mul = (principel_Amout * interest_Rate);
    fdr_interest_1m = (mul / (12 * 100));
    result_1M = fdr_interest_1m.toStringAsFixed(0);

    result = (fdr_interest_1m * tenor_list_value).toStringAsFixed(0);
    num p_i = principel_Amout + (fdr_interest_1m * tenor_list_value);
    result_with_principal = p_i.toStringAsFixed(0);

    // *! WITHOUT TIN 15%
  }

// String? fdr_interest_1m_TW;
//   String? fdr_interest_1m_TX ;
//   String? tw;
//   String? tx;
//   String? result_with_principal_TW;
//   String? result_with_principal_TX;
  withoutTinCalculate() {
    num inter_ = ((fdr_interest_1m * 15) / 100);
    num inter_1m = (fdr_interest_1m - inter_);
    fdr_interest_1m_TW = inter_1m.toStringAsFixed(0);

    num result = (inter_1m * tenor_list_value);
    tw_month_tenor = result.toStringAsFixed(0);
    num p_i = principel_Amout + result;
    result_with_principal_TW = p_i.toStringAsFixed(0);
  }

  withTinCalculate() {
    num inter_ = ((fdr_interest_1m * 10) / 100);
    num inter_1m = (fdr_interest_1m - inter_);
    fdr_interest_1m_TX = inter_1m.toStringAsFixed(0);

    num result = (inter_1m * tenor_list_value);
    tx_month_tenor = result.toStringAsFixed(0);
    num p_i = principel_Amout + result;
    result_with_principal_TX = p_i.toStringAsFixed(0);
  }

  withoutTin() {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Colors.blue,
          ),
          borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "After Tax (If NOT TIN 15%)",
                  style: TextStyle(
                      color: Colors.purple[600],
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
              ),
              // _getsizeboxed(hight: 10, width: 0),

              Text(
                "Interrest of 1M : $fdr_interest_1m_TW ",
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
              Text(
                "Interrest of $month : $tw_month_tenor",
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
              Text(
                "Int. + Principle of $month : $result_with_principal_TW ",
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }

  withTin() {
    return Container(
      //  height: 130,

      decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Colors.blue,
          ),
          borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "After Tax (If NOT TIN 10%)",
                  style: TextStyle(
                      color: Colors.purple[600],
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
              ),
              // _getsizeboxed(hight: 10, width: 0),

              Text(
                "Interrest of 1M : $fdr_interest_1m_TX ",
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
              Text(
                "Interrest of $month : $tx_month_tenor",
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
              Text(
                "Int. + Principle of $month : $result_with_principal_TX ",
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
