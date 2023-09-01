// ignore_for_file: prefer_interpolation_to_compose_strings
import 'package:cashcalculator/widget/custom%20button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class DpsCalculator extends StatefulWidget {
  const DpsCalculator({super.key});

  @override
  State<DpsCalculator> createState() => _DpsCalculatorState();
}

class _DpsCalculatorState extends State<DpsCalculator> {
  TextEditingController controllerDepositAmount = TextEditingController();
  TextEditingController controllerInterest = TextEditingController();
  double _value = 0.0;

  double? interestRate;
  double? totalPayment;
  double? years;
  double? doubletotalDeposit = 0;
  double? month;
  double? totalDeposit;
  String? sDa;
  String? sIOR;

  double? depositAmount;
  double? interestPayable;

  _getsizeboxed({required double hight, required double width}) {
    return SizedBox(
      height: hight,
      width: width,
    );
  }

  _getStyle(
      {required double size,
      required Color color,
      // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
      FontWeight = FontWeight.bold}) {
    return GoogleFonts.oswald(
        fontSize: size, fontWeight: FontWeight, color: color);
  }

  calculateDPS() {
    sDa = controllerDepositAmount.text;
    sIOR = controllerInterest.text;

    depositAmount = double.parse(sDa!);
    double rate = double.parse(sIOR!);
    interestRate = rate;
    years = _value;
    month = (years! * 12);

    double n = (((1 / 12) * (((month! * (month! + 1)) / 2))));

    interestPayable = (depositAmount! * n * rate) / 100; // rate / 100
    totalDeposit = (depositAmount! * month!);
    totalPayment = (totalDeposit! + interestPayable!);

    // print(totalDeposit);
    // print(totalPayment);
    // print(interestPayable);

    // print(n);

    FocusManager.instance.primaryFocus?.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding:
            const EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text('DPS Calculator',
                  style: _getStyle(size: 35, color: Colors.red)),
              _getsizeboxed(hight: 5, width: 0),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: TextField(
                  controller: controllerDepositAmount,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    label: Text('Deposit Amount',
                        style: GoogleFonts.roboto(
                            fontSize: 22,
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
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  label: Text('Interest Rate',
                      style: GoogleFonts.roboto(
                          fontSize: 22,
                          color: Colors.pink[200],
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
                        style: _getStyle(size: 28, color: Colors.red)),
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
                      max: 10,
                      value: _value,
                      interval: 1,
                      stepSize: 1,
                      //showTicks: false,
                      showLabels: true,
                      enableTooltip: false,
                      // minorTicksPerInterval: ,
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
                  calculateDPS();
                });
              }, Colors.pink[200]),
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
                            "Principal Amount",
                            style: TextStyle(
                                color: Colors.purple[600],
                                fontSize: 30,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "Taka : " + totalDeposit.toString(),
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
                            "Total Payable Amount",
                            style: TextStyle(
                                color: Colors.purple[600],
                                fontSize: 30,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "Taka :" + totalPayment.toString(),
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
                            "Interest",
                            style: TextStyle(
                                color: Colors.purple[600],
                                fontSize: 30,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "Taka : " + interestPayable.toString(),
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
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
