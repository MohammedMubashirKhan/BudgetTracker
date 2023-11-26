import 'package:flutter/material.dart';

Color contributionColor(int index) {
  // Assign a different color to each contribution based on its index
  List<Color> colors = [
    Colors.cyan,
    Colors.green,
    Colors.blue,
    Colors.pinkAccent
  ];
  return colors[index % colors.length];
}
