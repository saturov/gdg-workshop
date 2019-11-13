import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BatteryLevelScreen extends StatefulWidget {
  @override
  _BatteryLevelScreenState createState() => _BatteryLevelScreenState();
}

class _BatteryLevelScreenState extends State<BatteryLevelScreen> {
  static const _batteryChannel = const MethodChannel('gdg/battery');

  String _batteryLevel = 'Уровень заряда неизвестен';

  Future<void> _getBatteryLevel() async {
    String batteryLevel;

    try {
      final result = await _batteryChannel.invokeMethod<int>('getBatteryLevel');
      batteryLevel = 'Уровень заряда $result%';
    } on PlatformException catch (e) {
      batteryLevel = "Ошибка: '${e.message}'";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              _batteryLevel,
              style: TextStyle(fontSize: 24.0),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: MaterialButton(
                onPressed: _getBatteryLevel,
                child: Text('Узнать'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
