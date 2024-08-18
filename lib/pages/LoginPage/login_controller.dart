import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/base/base_state.dart';
import 'package:project/routes/pages.dart';
import 'package:project/routes/routes.dart';
import 'package:project/services/alert_service.dart';

class LoginController extends GetxController with BaseState {
  late TapGestureRecognizer tapGestureRecognizer;
  final userName = TextEditingController().obs;
  final password = TextEditingController().obs;
  final formKey = GlobalKey<FormState>();
  RxBool passwordVisibility = true.obs;
  @override
  void onInit() {
    tapGestureRecognizer = TapGestureRecognizer();
    super.onInit();
  }

  @override
  void dispose() {
    tapGestureRecognizer.dispose();
    super.dispose();
  }

  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      var result =
          await services.action.login(userName.value.text, password.value.text);
      if (result) {
        clear();
        if (services.db.loginUser.userType == 0) {
          // Etkinlik Oluşturucu 0 , etkinlik katılımcı 1
          Get.toNamed(Routes.activities);
        } else {
          Get.toNamed(Routes.home);
        }
      } else {
        services.alert
            .snackBarMessage(Get.context!, 'Hesap Bulunamadı', AlertType.error);
      }
    }
  }

  void clear() {
    userName.value.clear();
    password.value.clear();
  }
}
