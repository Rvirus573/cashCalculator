import 'package:hive/hive.dart';
part 'model.g.dart';

@HiveType(typeId: 0)
class Model extends HiveObject {
  @HiveField(0)
  String t1000;
  @HiveField(1)
  String t500;
  @HiveField(2)
  String t200;
  @HiveField(3)
  String t100;
  @HiveField(4)
  String t50;
  @HiveField(5)
  String t20;
  @HiveField(6)
  String t10;
  @HiveField(7)
  String t5;
  @HiveField(8)
  String t2;
  @HiveField(9)
  String t1;

  Model({
    required this.t1000,
    required this.t500,
    required this.t200,
    required this.t100,
    required this.t50,
    required this.t20,
    required this.t10,
    required this.t5,
    required this.t2,
    required this.t1,
  });
}
