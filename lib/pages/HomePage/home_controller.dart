import 'package:get/get.dart';
import 'package:project/base/base_state.dart';
import 'package:project/models/city.dart';
import 'package:project/models/district.dart';
import 'package:project/models/user.dart';

class HomeController extends GetxController with BaseState {
  RxList<City> cities = <City>[].obs;
  final Rx<City?> selectedCity = Rx<City?>(null);

  RxList<District> disctricts = <District>[].obs;
  RxList<District> tempDistricts = <District>[].obs;
  final Rx<District?> selectedDistrict = Rx<District?>(null);

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
    cities.value = await services.action.loadCities();
    disctricts.value = await services.action.loadDisctricts();
    super.onInit();
  }

  void addActivity() {
    services.action.addActivity();
  }
}
