import 'package:project/services/action_service.dart';
import 'package:project/services/alert_service.dart';
import 'package:project/services/db_Service.dart';

class ServiceStates {
  static final _instance = ServiceStates._internal();
  factory ServiceStates() => _instance;
  ServiceStates._internal();

  final db = DbService();
  final action = ActionService();
  final alert = AlertService();
}
