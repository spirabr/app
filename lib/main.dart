import 'package:flutter/material.dart';

import 'package:SPIRA/constants.dart' as contants;
import 'package:SPIRA/select_collector.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SPIRA',
      theme: ThemeData(
        brightness: Brightness.light,
        accentColor: contants.darkGreen,
        primaryColor: contants.brightGreen,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Montserrat',
      ),
      home: SelectCollector(),
    );
  }
}
