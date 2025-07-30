import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:recordatoriodeagua/screens/home_screen.dart';
import 'models/water_log.dart';
import 'models/water_day.dart';
import 'services/water_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inicializar Hive y registrar adaptadores
  await Hive.initFlutter();
  Hive.registerAdapter(WaterLogAdapter());
  Hive.registerAdapter(WaterDayAdapter());

  // Abrir una caja para los días de agua
  await Hive.openBox<WaterDay>('water_days');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Prueba al iniciar
    WaterService.addWater(200); // ← agrega 200 ml

    final today = WaterService.getTodayData();
    print('Cantidad total hoy: ${today.totalConsumed} ml');
    print('Registros de hoy:');
    for (var log in today.logs) {
      print('- ${log.amount} ml a las ${log.time}');
    }

    return MaterialApp(title: 'Recordatorio de Agua', home: const HomeScreen());
  }
}
