import 'package:hive/hive.dart';
import 'water_log.dart';

part 'water_day.g.dart';

@HiveType(typeId: 1)
class WaterDay {
  @HiveField(0)
  DateTime date;

  @HiveField(1)
  double totalConsumed;

  @HiveField(2)
  List<WaterLog> logs;

  WaterDay({
    required this.date,
    required this.totalConsumed,
    required this.logs,
  });

  bool get completed => totalConsumed >= 5.0;
}
