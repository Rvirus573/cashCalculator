import 'dart:math';

import 'package:cashcalculator/widget/custom%20button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class EMICalculator extends StatefulWidget {
  const EMICalculator({super.key});

  @override
  State<EMICalculator> createState() => _EMICalculatorState();
}

class _EMICalculatorState extends State<EMICalculator> {
  TextEditingController controllerPrincipalAmount = TextEditingController();
  TextEditingController controllerInterest = TextEditingController();
  double _value = 0.0;

  double? interestRate;

  double? totalPayment;
  double? years;
  double? loanEMI;
  double? month;

  String lemi = '';
  String tip = '';
  String tpa = '';

  _getsizeboxed({required double hight, required double width}) {
    return SizedBox(
      height: hight,
      width: width,
    );
  }

  late double principalAmount = 0;
  late double interestPayable = 0;

  update() {
    setState(() {
      principalAmount;
      interestPayable;
      month;
    });
  }

  String? sPa;
  String? sIOR;
  String? sTenor;

  late Map<String, double> dataMap = {
    "Principle Amount": 0,
    "Interest": 0,
  };

  calculateEMI() {
    sPa = controllerPrincipalAmount.text;
    sIOR = controllerInterest.text;

    principalAmount = double.parse(sPa!);
    double rate = double.parse(sIOR!);
    interestRate = (rate / 12 / 100);
    years = _value;
    month = (years! * 12);

    loanEMI = (principalAmount *
        interestRate! *
        pow((1 + interestRate!), month!) /
        (pow((1 + interestRate!), month!) - 1));

    // (principalAmount! * interestRate! * (1 + interestRate!) * month!) /
    //     ((1 + interestRate!) * (month! - 1));
    interestPayable = (loanEMI! * month!) - principalAmount;
    totalPayment = principalAmount + interestPayable;
    // loanEMI = (totalPayment! / 12);

    lemi = loanEMI!.toStringAsFixed(0);
    tip = interestPayable.toStringAsFixed(0);
    tpa = totalPayment!.toStringAsFixed(0);
    FocusManager.instance.primaryFocus?.unfocus();
  }

  // Map<String, double> dataMap= {
  //   "Principle Amount": principalAmount!,
  //   "Interest": totalPayment!,
  // };

  final colorList = <Color>[
    //const Color(0xfffdcb6e),
    const Color(0xfffd79a8),
    const Color(0xff0984e3),

    //const Color(0xffe17055),
    //const Color(0xff6c5ce7),
  ];

  _getStyle(
      {required double size,
      required Color color,
      // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
      FontWeight = FontWeight.bold}) {
    return GoogleFonts.oswald(
        fontSize: size, fontWeight: FontWeight, color: color);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(right: 10, left: 10, top: 5, bottom: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text('EMI Calculator',
                  style: _getStyle(size: 35, color: Colors.red)),
              _getsizeboxed(hight: 5, width: 0),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: TextField(
                  controller: controllerPrincipalAmount,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    label: Text('Principal Amount',
                        style: GoogleFonts.roboto(
                            fontSize: 22,
                            color: Colors.purple[600],
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
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  label: Text('Interest Rate',
                      style: GoogleFonts.roboto(
                          fontSize: 22,
                          color: Colors.purple[600],
                          fontWeight: FontWeight.bold)),
                  hintText: 'Type Here...',
                  hintStyle: GoogleFonts.openSans(fontSize: 18),
                ),
              ),
              _getsizeboxed(hight: 10, width: 0),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Tenure Years',
                        style: _getStyle(size: 25, color: Colors.red)),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Years : ",
                          style: _getStyle(size: 20, color: Colors.purple),
                        ),
                        Text(
                          '${_value.toStringAsFixed(0)}  or',
                          style: _getStyle(size: 20, color: Colors.purple),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Month : ",
                          style: _getStyle(size: 20, color: Colors.purple),
                        ),
                        Text(
                          (_value * 12).toStringAsFixed(0),
                          style: _getStyle(size: 20, color: Colors.purple),
                        ),
                      ],
                    ),
                    SfSlider(
                      min: 0,
                      max: 20,
                      value: _value,
                      interval: 5,
                      stepSize: 0.5,
                      //showTicks: false,
                      showLabels: true,
                      enableTooltip: false,
                      minorTicksPerInterval: 1,
                      onChanged: (dynamic value) {
                        setState(() {
                          _value = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              _getsizeboxed(hight: 10, width: 0),
              customButton('CALCULATE', () {
                setState(() {
                  calculateEMI();

                  dataMap = {
                    "Principle Amount": principalAmount,
                    "Interest": interestPayable,
                  };
                  // print(principalAmount);
                  // print(dataMap);
                });
              }, Colors.purple[300]),
              _getsizeboxed(hight: 10, width: 0),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Colors.blue,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            "Loan EMI",
                            style: TextStyle(
                                color: Colors.purple[600],
                                fontSize: 30,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "Taka : $lemi",
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                  ),
                  _getsizeboxed(hight: 10, width: 0),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Colors.blue,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            "Total Interest Payable",
                            style: TextStyle(
                                color: Colors.purple[600],
                                fontSize: 30,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "Taka : $tip",
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                  ),
                  _getsizeboxed(hight: 10, width: 0),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Colors.blue,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            "Total of Payments",
                            style: TextStyle(
                                color: Colors.purple[600],
                                fontSize: 30,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "Taka : $tpa",
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.w700),
                          ),
                          _getsizeboxed(hight: 10, width: 0),
                        ],
                      ),
                    ),
                  ),
                  _getsizeboxed(hight: 20, width: 0),
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Colors.blue,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: PieChart(
                      dataMap: dataMap,
                      animationDuration: const Duration(milliseconds: 800),
                      chartLegendSpacing: 32,
                      chartRadius: MediaQuery.of(context).size.width / 3.2,
                      colorList: colorList,
                      initialAngleInDegree: 0,
                      chartType: ChartType.ring,
                      ringStrokeWidth: 32,
                      centerText: "EMI",
                      legendOptions: const LegendOptions(
                        showLegendsInRow: false,
                        legendPosition: LegendPosition.right,
                        showLegends: true,
                        legendShape: BoxShape.circle,
                        legendTextStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      chartValuesOptions: const ChartValuesOptions(
                        showChartValueBackground: true,
                        showChartValues: true,
                        showChartValuesInPercentage: true,
                        showChartValuesOutside: false,
                        decimalPlaces: 1,
                      ),
                      // gradientList: ---To add gradient colors---
                      // emptyColorGradient: ---Empty Color gradient---
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
