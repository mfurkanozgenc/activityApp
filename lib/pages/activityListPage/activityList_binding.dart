import 'package:get/get.dart';
import 'package:project/pages/activityListPage/activityList_controller.dart';

class ActivityListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ActivityListController());
  }
}
