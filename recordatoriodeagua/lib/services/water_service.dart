import 'package:hive/hive.dart';
import '../models/water_day.dart';
import '../models/water_log.dart';

class WaterService {
  static final Box<WaterDay> _box = Hive.box<WaterDay>('water_days');

  static String _dateKey(DateTime date) {
    return "${date.year}-${date.month}-${date.day}";
  }

  // Obtener el registro de hoy
  static WaterDay getTodayData() {
    final key = _dateKey(DateTime.now());

    return _box.get(key) ??
        WaterDay(date: DateTime.now(), totalConsumed: 0, logs: []);
  }

  // Agregar cantidad de agua al día actual
  static void addWater(double amount) {
    final now = DateTime.now();
    final key = _dateKey(now);

    WaterDay day =
        _box.get(key) ?? WaterDay(date: now, totalConsumed: 0, logs: []);

    day.totalConsumed += amount;
    day.logs.add(WaterLog(time: now, amount: amount));

    _box.put(key, day);
  }

  // Obtener todos los registros
  static List<WaterDay> getAllDays() {
    return _box.values.toList();
  }

  // Saber si un día se cumplió la meta
  static bool isDayCompleted(DateTime date) {
    final key = _dateKey(date);
    final day = _box.get(key);
    return day?.completed ?? false;
  }
}
