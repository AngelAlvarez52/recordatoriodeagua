import 'package:hive/hive.dart';

part 'water_log.g.dart';

@HiveType(typeId: 0)
class WaterLog {
  @HiveField(0)
  DateTime time;

  @HiveField(1)
  double amount;

  WaterLog({required this.time, required this.amount});
}
