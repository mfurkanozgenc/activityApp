import 'dart:ui';

import 'package:flutter/material.dart';

class ColorConstants {
  static final _instance = ColorConstants._internal();
  factory ColorConstants() => _instance;
  ColorConstants._internal();
  final generalColor = const Color(0xFF6B8E23);
  final errorColor = const Color(0xFFee403c);
  final textColor = Colors.white;
}
