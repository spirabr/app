import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Color darkGreen = Color(0xFF318E88);
Color brightGreen = Color(0xFF01BD9D);

enum Hospital {
  hc,
  hcor
}

class Collector {
  String name;
  Hospital hospital;

  Collector(this.name, this.hospital);

  @override
  String toString() {
    return '${this.name} (${describeEnum(this.hospital).toUpperCase()})';
  }
}

List<Collector> collectors = [
  Collector('Alice', Hospital.hc),
  Collector('Bob', Hospital.hc),
  Collector('Carol', Hospital.hcor)
];
