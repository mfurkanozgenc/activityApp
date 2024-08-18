import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:project/base/base_state.dart';
import 'package:project/routes/routes.dart';
import 'package:project/services/alert_service.dart';

class CreateController extends GetxController with BaseState {
  final phoneFormatter = MaskTextInputFormatter(
    mask: '(###) ### ## ##',
    filter: {"#": RegExp(r'[0-9]')},
  );
  final identificationFormatter = MaskTextInputFormatter(
    mask: '###########',
    filter: {"#": RegExp(r'[0-9]')},
  );
  final ImagePicker picker = ImagePicker();
  final formKey = GlobalKey<FormState>();
  RxInt selectedPage = 0.obs;
  Rx<String> selectedPhoto = ''.obs; // Default image
  RxBool passwordVisibility = true.obs;
  RxBool passwordAgainVisibility = true.obs;
  final fullName = TextEditingController().obs;
  final phoneNumber = TextEditingController().obs;
  final identificationNumber = TextEditingController().obs;
  final userName = TextEditingController().obs;
  final password = TextEditingController().obs;
  final passwordAgain = TextEditingController().obs;

  Future<void> selectPhoto() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      Uint8List fileBytes = await pickedFile.readAsBytes();
      String base64Image = base64Encode(fileBytes);
      selectedPhoto.value = base64Image;
    } else {}
  }

  Future<void> createUser(int selectedPage, BuildContext context) async {
    if (formKey.currentState!.validate()) {
      var result = await services.action.addUser(
          fullName.value.text,
          phoneNumber.value.text,
          identificationNumber.value.text,
          userName.value.text,
          password.value.text,
          selectedPhoto.value,
          selectedPage);

      if (result == 'success') {
        services.alert.snackBarMessage(
            context, 'Kayıt Başarılı.Lütfen Giriş Yapın', AlertType.success);
        Get.toNamed(Routes.login);
        clear();
      } else {
        services.alert.snackBarMessage(context, result, AlertType.error);
      }
    }
  }

  void clear() {
    fullName.value.clear();
    phoneNumber.value.clear();
    identificationNumber.value.clear();
    userName.value.clear();
    password.value.clear();
    selectedPhoto.value = '';
    selectedPage.value = 0;
  }
}
