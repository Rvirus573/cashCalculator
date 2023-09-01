import 'dart:async';

import 'package:cashcalculator/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  chooseScreen() {
    //timer vs future.delayed

    Get.toNamed(home);
  }

  @override
  void initState() {
  
    super.initState();

    Timer(const Duration(seconds: 2), () => chooseScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            'assets/images/taka.png',
            height: 100,
            width: 100,
          ),
          const Text(
            'Cash Calculator',
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.italic),
          ),
          const SizedBox(
            height: 15,
          ),
          const CircularProgressIndicator(),
        ]),
      ),
    );
  }
}
