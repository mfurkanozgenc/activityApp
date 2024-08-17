import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:project/base/base_state.dart';
import 'package:project/pages/createPage/create_controller.dart';
import 'package:project/routes/routes.dart';

class CreateView extends GetView<CreateController> with BaseState {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Kayıt Olun'.toUpperCase()),
            centerTitle: true,
            backgroundColor: constants.color.generalColor,
            bottom: const TabBar(indicatorColor: Colors.white, tabs: [
              Tab(
                child: Text('Etkinlik Oluşturucu'),
              ),
              Tab(
                child: Text('Etkinlik Katılımcı'),
              )
            ]),
          ),
          body: TabBarView(children: [
            _form(selectedPage: 0),
            _form(selectedPage: 1),
          ]),
        ));
  }
}

class _form extends GetView<CreateController> with BaseState {
  _form({required this.selectedPage});
  int selectedPage = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.transparent,
          width: Get.width * .3,
          height: Get.width * .3,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () => controller.selectPhoto(),
              child: Obx(() => controller.selectedPhoto.value.isNotEmpty
                  ? ClipOval(
                      child: Container(
                        width: Get.width * 0.2 - 16,
                        height: Get.width * 0.2 - 16,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: MemoryImage(
                                base64Decode(controller.selectedPhoto.value)),
                          ),
                        ),
                      ),
                    )
                  : CircleAvatar(
                      radius: (Get.width * 0.2 - 16) / 2,
                      backgroundColor: constants.color.generalColor,
                      child: const Icon(
                        Icons.camera_alt,
                        color: Colors.black,
                      ),
                    )),
            ),
          ),
        ),
        Expanded(
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
                          return 'Lütfen Doldurunuz';
                        }
                        if (value.length < 3) {
                          return 'Lütfen En Az 3 Karakter Giriniz';
                        }
                      },
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(25),
                      ],
                      controller: controller.fullName.value,
                      decoration: InputDecoration(
                          label: const Text('Ad-Soyad'),
                          labelStyle: const TextStyle(color: Colors.black),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.grey)),
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
                          return 'Lütfen Telefon Giriniz';
                        }
                        if (value.length < 14) {
                          return 'Lütfen Geçerli Telefon Giriniz';
                        }
                      },
                      inputFormatters: [controller.phoneFormatter],
                      controller: controller.phoneNumber.value,
                      decoration: InputDecoration(
                          label: const Text('Telefon Numarası'),
                          labelStyle: const TextStyle(color: Colors.black),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.grey)),
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
                          return 'Lütfen T.C Kimlik Giriniz';
                        }
                        if (value.length < 11) {
                          return 'Lütfen 11 Haneli Kimlik No Giriniz';
                        }
                      },
                      inputFormatters: [controller.identificationFormatter],
                      controller: controller.identificationNumber.value,
                      decoration: InputDecoration(
                          label: const Text('T.C Kimlik No'),
                          labelStyle: const TextStyle(color: Colors.black),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.grey)),
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
                          return 'Lütfen Doldurunuz';
                        }
                        if (value.length < 3) {
                          return 'Lütfen En Az 3 Karakter Giriniz';
                        }
                      },
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(20),
                      ],
                      controller: controller.userName.value,
                      decoration: InputDecoration(
                          label: const Text('Kullanıcı Adı'),
                          labelStyle: const TextStyle(color: Colors.black),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.grey)),
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
                    child: Obx(
                      () => TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Lütfen Doldurunuz';
                          }
                          if (value.length < 6) {
                            return 'Lütfen En Az 6 Karakter Giriniz';
                          }
                        },
                        controller: controller.password.value,
                        obscureText: controller.passwordVisibility.value,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(20),
                        ],
                        decoration: InputDecoration(
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: IconButton(
                                icon: Icon(
                                  controller.passwordVisibility.value
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  controller.passwordVisibility.value =
                                      !controller.passwordVisibility.value;
                                },
                              ),
                            ),
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
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Obx(
                      () => TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Lütfen Doldurunuz';
                          }
                          if (value.length < 6) {
                            return 'Lütfen En Az 6 Karakter Giriniz';
                          }

                          if (controller.password.value.text !=
                              controller.passwordAgain.value.text) {
                            return 'Şifre Tekrarı Uyuşmamakta';
                          }
                        },
                        controller: controller.passwordAgain.value,
                        obscureText: controller.passwordAgainVisibility.value,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(20),
                        ],
                        decoration: InputDecoration(
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: IconButton(
                                icon: Icon(
                                  controller.passwordAgainVisibility.value
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  controller.passwordAgainVisibility.value =
                                      !controller.passwordAgainVisibility.value;
                                },
                              ),
                            ),
                            label: const Text('Şifre Tekrar'),
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
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () =>
                          controller.createUser(selectedPage, context),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: constants.color.generalColor,
                          minimumSize: Size(Get.width * .7, 50),
                          shape: ContinuousRectangleBorder(
                              borderRadius: BorderRadius.circular(25))),
                      child: Text('Kayıt Ol'.toUpperCase()),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      child: Text(
                        'Giriş Ekranına Geri Dön',
                        style: TextStyle(color: constants.color.generalColor),
                      ),
                      onPressed: () {
                        Get.toNamed(Routes.login);
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
