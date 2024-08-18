import 'package:get/get.dart';
import 'package:project/base/base_state.dart';
import 'package:project/models/user.dart';

class HomeController extends GetxController with BaseState {
  late Rx<User?> loginUser = User(
          userName: '',
          date: 0,
          fullName: '',
          id: '',
          identificationNumber: '',
          image: '',
          password: '',
          phoneNumber: '',
          userType: 0)
      .obs;
  @override
  Future<void> onInit() async {
    loginUser.value = await services.storage.refreshPage();

    print(loginUser!.value!.image);
    super.onInit();
  }

  void addActivity() {
    services.action.addActivity();
  }
}
