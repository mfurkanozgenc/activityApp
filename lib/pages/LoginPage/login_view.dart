import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/base/base_state.dart';
import 'package:project/pages/LoginPage/login_controller.dart';
import 'package:project/routes/routes.dart';

class LoginView extends GetView<LoginController> with BaseState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          color: constants.color.generalColor,
          height: Get.height * .4,
          width: Get.width,
          child: Center(
              child: Text(
            'Aktivite Uygulaması'.toUpperCase(),
            style: TextStyle(color: constants.color.textColor),
          )),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Lütfen Kullanıcı Adınızı Giriniz';
                          }
                        },
                        controller: controller.userName.value,
                        decoration: InputDecoration(
                            label: const Text('Kullanıcı Adı'),
                            labelStyle: const TextStyle(color: Colors.black),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.grey)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: constants.color.generalColor)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: constants.color.errorColor)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: constants.color.errorColor))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Lütfen Şifrenizi Giriniz';
                          }
                        },
                        controller: controller.password.value,
                        decoration: InputDecoration(
                            label: const Text('Şifre'),
                            labelStyle: const TextStyle(color: Colors.black),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.grey)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: constants.color.generalColor)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: constants.color.errorColor)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: constants.color.errorColor))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: controller.login,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: constants.color.generalColor,
                            minimumSize: Size(Get.width * .7, 50),
                            shape: ContinuousRectangleBorder(
                                borderRadius: BorderRadius.circular(25))),
                        child: Text('Giriş Yap'.toUpperCase()),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(
                          text:
                              TextSpan(text: 'Hesabınız Yok Mu ? ', children: [
                        TextSpan(
                            recognizer: controller.tapGestureRecognizer
                              ..onTap = () {
                                Get.toNamed(Routes.create);
                              },
                            text: 'Kayıt Olun',
                            style:
                                TextStyle(color: constants.color.generalColor))
                      ])),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Container(
          color: constants.color.generalColor,
          height: Get.height * .05,
          width: Get.width,
          child: Center(
              child: Text(
            'ÖZGENÇ ®'.toUpperCase(),
            style: TextStyle(color: constants.color.textColor),
          )),
        ),
      ],
    ));
  }
}
