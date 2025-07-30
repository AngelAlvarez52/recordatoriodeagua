import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/water_log.dart';
import 'models/water_day.dart';

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
    return MaterialApp(
      title: 'Recordatorio de Agua',
      home: Scaffold(
        appBar: AppBar(title: Text('Recordatorio de Agua')),
        body: Center(child: Text('Pantalla principal aquí')),
      ),
    );
  }
}
