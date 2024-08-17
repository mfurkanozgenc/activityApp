import 'package:get/get.dart';
import 'package:project/base/base_state.dart';

class HomeController extends GetxController with BaseState {
  void addActivity() {
    services.action.addActivity();
  }
}
