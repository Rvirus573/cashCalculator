import 'package:cashcalculator/cp.dart';
import 'package:cashcalculator/fdr.dart';
import 'package:cashcalculator/home.dart';
import 'package:cashcalculator/splash.dart';
import 'package:get/get.dart';

const String splash = '/splash';
const String home = '/home';
const String cp = '/cp';
const String fdr = '/fdr';

List<GetPage> getpages = [
  GetPage(name: splash, page: () => const Splash()),
  GetPage(name: home, page: () => const Home()),
  GetPage(name: home, page: () => const Cp()),
  GetPage(name: home, page: () => const Fdr()),
];
