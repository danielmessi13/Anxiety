import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_android/android_hardware.dart'
    show Sensor, SensorEvent, SensorManager;

class HomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  int accuracy;
  int sensorType;
  String sensorName;
  double value;
  StreamSubscription subscription;

  @override
  void initState() {
    getSensor();
    super.initState();
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  Future<void> getSensor() async {
    var sensor = await SensorManager.getDefaultSensor(Sensor.TYPE_HEART_RATE);
    var events = await sensor?.subscribe();
    subscription = events?.listen(listenSensor);
  }

  void listenSensor(SensorEvent event) {
    setState(() {
      value = event.values[0];
      sensorName = event.sensor.name;
      accuracy = event.accuracy;
      sensorType = event.sensor.type;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Accuracy: $accuracy"),
            SizedBox(height: 10),
            Text("Value: $value"),
            SizedBox(height: 10),
            Text("Sensor name: $sensorName"),
            SizedBox(height: 10),
            Text("Sensor type: $sensorType"),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
