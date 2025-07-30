import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/water_log.dart';
import '../services/water_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double amount = 200;

  void _addWater() {
    WaterService.addWater(amount);
    setState(() {}); // actualiza pantalla
  }

  void _removeWater() {
    WaterService.addWater(-amount);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final today = WaterService.getTodayData();
    final porcentaje = (today.totalConsumed / 5000).clamp(0.0, 1.0);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Recordatorio de Agua'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Círculo de progreso
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 150,
                  height: 150,
                  child: CircularProgressIndicator(
                    value: porcentaje,
                    strokeWidth: 12,
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${(today.totalConsumed / 1000).toStringAsFixed(1)} L',
                      style: const TextStyle(fontSize: 24),
                    ),
                    const Text('de 5 L'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Controles de agua
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove_circle, size: 32),
                  onPressed: _removeWater,
                ),
                const SizedBox(width: 16),
                SizedBox(
                  width: 100,
                  child: TextField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      final parsed = double.tryParse(value);
                      if (parsed != null) {
                        setState(() {
                          amount = parsed;
                        });
                      }
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: '200',
                      suffixText: 'ml',
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                IconButton(
                  icon: const Icon(Icons.add_circle, size: 32),
                  onPressed: _addWater,
                ),
              ],
            ),

            const SizedBox(height: 24),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('Historial de hoy:', style: TextStyle(fontSize: 18)),
            ),
            const SizedBox(height: 8),

            // Lista de registros
            Expanded(
              child: ListView.builder(
                itemCount: today.logs.length,
                itemBuilder: (context, index) {
                  WaterLog log = today.logs[index];
                  return ListTile(
                    leading: const Icon(Icons.water_drop),
                    title: Text('${log.amount.toStringAsFixed(0)} ml'),
                    subtitle: Text(DateFormat.Hm().format(log.time)),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      // Navegación inferior (placeholder)
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Calendario',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Cuenta'),
        ],
      ),
    );
  }
}
