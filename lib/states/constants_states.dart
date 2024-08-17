import 'package:project/constanst/color_constants.dart';

class ConstantsStates {
  static final _instance = ConstantsStates._internal();
  factory ConstantsStates() => _instance;
  ConstantsStates._internal();
  final color = ColorConstants();
}
