import 'package:flutter/material.dart';
import 'package:project/states/constants_states.dart';

class AlertService {
  static final _instance = AlertService._internal();
  AlertService._internal();
  late ConstantsStates constants;
  factory AlertService() {
    _instance.constants = ConstantsStates();
    return _instance;
  }

  void snackBarMessage(
      BuildContext context, String message, AlertType alertType) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        message,
        textAlign: TextAlign.center,
      ),
      backgroundColor: alertType == AlertType.success
          ? constants.color.generalColor
          : constants.color.errorColor,
    ));
  }
}

enum AlertType { error, success }
