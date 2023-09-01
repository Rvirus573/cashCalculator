
import 'package:cashcalculator/model/model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Boxes {
  static Box<Model> getData() => Hive.box<Model>('data_box');
}