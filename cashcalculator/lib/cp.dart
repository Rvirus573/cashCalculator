import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'model/model.dart';
import 'widget/custom_text_field.dart';

class Cp extends StatefulWidget {
  const Cp({super.key});

  @override
  State<Cp> createState() => _CpState();
}

class _CpState extends State<Cp> {
  _getStyle(
      {required double size,
      required Color color,
      // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
      FontWeight = FontWeight.bold}) {
    return GoogleFonts.oswald(
        fontSize: size, fontWeight: FontWeight, color: color);
  }

  TextEditingController controller_1000 = TextEditingController();
  TextEditingController controller_500 = TextEditingController();
  TextEditingController controller_200 = TextEditingController();
  TextEditingController controller_100 = TextEditingController();
  TextEditingController controller_50 = TextEditingController();
  TextEditingController controller_20 = TextEditingController();
  TextEditingController controller_10 = TextEditingController();
  TextEditingController controller_5 = TextEditingController();
  TextEditingController controller_2 = TextEditingController();
  TextEditingController controller_1 = TextEditingController();

  // ignore: non_constant_identifier_names
  int t_sum = 0;
  int result1000 = 0;
  int result500 = 0;
  int result200 = 0;
  int result100 = 0;
  int result50 = 0;
  int result20 = 0;
  int result10 = 0;
  int result5 = 0;
  int result2 = 0;
  int result1 = 0;
  int nill = 0;

  // ignore: non_constant_identifier_names
  total_sum() {
    t_sum = result1000 +
        result500 +
        result200 +
        result100 +
        result50 +
        result20 +
        result10 +
        result5 +
        result2 +
        result1;
  }

  String mul_1000 = "0";
  String mul_500 = "0";
  String mul_200 = "0";
  String mul_100 = "0";
  String mul_50 = "0";
  String mul_20 = "0";
  String mul_10 = "0";
  String mul_5 = "0";
  String mul_2 = "0";
  String mul_1 = "0";
  String s = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[200],
        title: const Center(child: Text("Cash Calculator")),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text('Cash Calculator',
                      style: _getStyle(size: 35, color: Colors.red)),
                ),
                Center(
                  child: Row(
                    children: [
                      const Text(
                        'Total =',
                        style: TextStyle(fontSize: 35, color: Colors.red),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        t_sum.toString(),
                        style:
                            const TextStyle(fontSize: 35, color: Colors.green),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  onChanged: (val) {
                    setState(() {
                      s = val;

                      // ignore: unnecessary_null_comparison
                      if (val == "" || val == null) {
                        mul_1000 = "0";
                        result1000 = 0;
                        total_sum();
                      } else {
                        result1000 = 1000 * int.parse(s);
                        mul_1000 = result1000.toString();
                        total_sum();
                        //t_sum = result1000 + result500;
                      }
                    });
                  },
                  controller: controller_1000,
                  total: mul_1000,
                  hint: '1000',
                ),
                const SizedBox(
                  height: 5,
                ),
                CustomTextField(
                  onChanged: (val) {
                    setState(() {
                      s = val;
                      // ignore: unnecessary_null_comparison
                      if (val == "") {
                        mul_500 = "0";
                        result500 = 0;
                        total_sum();
                      } else {
                        result500 = 500 * int.parse(s);
                        mul_500 = result500.toString();
                        total_sum();
                      }
                    });
                  },
                  controller: controller_500,
                  total: mul_500,
                  hint: '500',
                ),
                const SizedBox(
                  height: 5,
                ),
                CustomTextField(
                  onChanged: (val) {
                    setState(() {
                      s = val;
                      // ignore: unnecessary_null_comparison
                      if (val == "") {
                        mul_200 = "0";
                        result200 = 0;
                        total_sum();
                      } else {
                        result200 = 200 * int.parse(s);
                        mul_200 = result200.toString();
                        total_sum();
                      }
                    });
                  },
                  controller: controller_200,
                  total: mul_200,
                  hint: '200',
                ),
                const SizedBox(
                  height: 5,
                ),
                CustomTextField(
                  onChanged: (val) {
                    setState(() {
                      s = val;
                      // ignore: unnecessary_null_comparison
                      if (val == "") {
                        mul_100 = "0";
                        result100 = 0;
                        total_sum();
                      } else {
                        result100 = 100 * int.parse(s);
                        mul_100 = result100.toString();
                        total_sum();
                      }
                    });
                  },
                  controller: controller_100,
                  total: mul_100,
                  hint: '100',
                ),
                const SizedBox(
                  height: 5,
                ),
                CustomTextField(
                    onChanged: (val) {
                      setState(() {
                        s = val;
                        // ignore: unnecessary_null_comparison
                        if (val == "") {
                          mul_50 = "0";
                          result50 = 0;
                          total_sum();
                        } else {
                          result50 = 50 * int.parse(s);
                          mul_50 = result50.toString();
                          total_sum();
                        }
                      });
                    },
                    controller: controller_50,
                    total: mul_50,
                    hint: '50'),
                const SizedBox(
                  height: 5,
                ),
                CustomTextField(
                    onChanged: (val) {
                      setState(() {
                        s = val;
                        // ignore: unnecessary_null_comparison
                        if (val == "") {
                          mul_20 = "0";
                          result20 = 0;
                          total_sum();
                        } else {
                          result20 = 20 * int.parse(s);
                          mul_20 = result20.toString();
                          total_sum();
                        }
                      });
                    },
                    controller: controller_20,
                    total: mul_20,
                    hint: '20'),
                const SizedBox(
                  height: 5,
                ),
                CustomTextField(
                    onChanged: (val) {
                      setState(() {
                        s = val;
                        // ignore: unnecessary_null_comparison
                        if (val == "") {
                          mul_10 = "0";
                          result10 = 0;
                          total_sum();
                        } else {
                          result5 = 10 * int.parse(s);
                          mul_10 = result5.toString();
                          total_sum();
                        }
                      });
                    },
                    controller: controller_10,
                    total: mul_10,
                    hint: '10'),
                const SizedBox(
                  height: 5,
                ),
                CustomTextField(
                    onChanged: (val) {
                      setState(() {
                        s = val;
                        // ignore: unnecessary_null_comparison
                        if (val == "") {
                          mul_5 = "0";
                          result5 = 0;
                          total_sum();
                        } else {
                          result5 = 5 * int.parse(s);
                          mul_5 = result5.toString();
                          total_sum();
                        }
                      });
                    },
                    controller: controller_5,
                    total: mul_5,
                    hint: '5'),
                const SizedBox(
                  height: 5,
                ),
                CustomTextField(
                    onChanged: (val) {
                      setState(() {
                        s = val;
                        // ignore: unnecessary_null_comparison
                        if (val == "") {
                          mul_2 = "0";
                          result2 = 0;
                          total_sum();
                        } else {
                          result2 = 2 * int.parse(s);
                          mul_2 = result2.toString();
                          total_sum();
                        }
                      });
                    },
                    controller: controller_2,
                    total: mul_2,
                    hint: '2'),
                const SizedBox(
                  height: 5,
                ),
                CustomTextField(
                    onChanged: (val) {
                      setState(() {
                        s = val;
                        // ignore: unnecessary_null_comparison
                        if (val == "") {
                          mul_1 = "0";
                          result1 = 0;
                          total_sum();
                        } else {
                          result1 = 1 * int.parse(s);
                          mul_1 = result1.toString();
                          total_sum();
                        }
                      });
                    },
                    controller: controller_1,
                    total: mul_1,
                    hint: '1'),
                const SizedBox(
                  height: 25,
                ),
                const SizedBox(
                  width: 35,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> editData(
      Model model,
      String t1000,
      String t500,
      String t200,
      String t100,
      String t50,
      String t20,
      String t10,
      String t5,
      String t2,
      String t1) async {
    controller_1000.text = t1000;
    controller_500.text = t500;
    controller_200.text = t200;
    controller_100.text = t100;
    controller_50.text = t50;
    controller_20.text = t20;
    controller_10.text = t10;
    controller_5.text = t5;
    controller_2.text = t2;
    controller_1.text = t1;
  }
}
