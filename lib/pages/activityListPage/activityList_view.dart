import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:project/base/base_state.dart';
import 'package:project/models/city.dart';
import 'package:project/models/district.dart';
import 'package:project/pages/activityListPage/activityList_controller.dart';

class ActivityListView extends GetView<ActivityListController> with BaseState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Etkinlikler'.toUpperCase()),
        centerTitle: true,
        backgroundColor: constants.color.generalColor,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        title: Text(
                          'Etkinlik Ekle'.toUpperCase(),
                          textAlign: TextAlign.center,
                        ),
                        content: Container(
                          color: Colors.transparent,
                          height: Get.height * .8,
                          width: Get.width,
                          child: Form(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  controller.selectedPhoto.value.isNotEmpty
                                      ? Container(
                                          height: Get.height * 0.1,
                                          width: Get.width * .6,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: MemoryImage(
                                                      base64Decode(controller
                                                          .selectedPhoto
                                                          .value)))),
                                        )
                                      : Container(
                                          decoration: BoxDecoration(
                                            color: constants.color.generalColor,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          height: Get.height * 0.2,
                                          width: Get.height * 0.2,
                                          child: const Icon(
                                            Icons.camera_alt,
                                            color: Colors.white,
                                          ),
                                        ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          label: const Text('Etkinlik Adı'),
                                          labelStyle: const TextStyle(
                                              color: Colors.black),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                  color: Colors.grey)),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: constants
                                                      .color.generalColor)),
                                          errorBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: constants
                                                      .color.errorColor)),
                                          focusedErrorBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: constants.color.errorColor))),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          label: const Text('Açıklama'),
                                          labelStyle: const TextStyle(
                                              color: Colors.black),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                  color: Colors.grey)),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: constants
                                                      .color.generalColor)),
                                          errorBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: constants
                                                      .color.errorColor)),
                                          focusedErrorBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: constants.color.errorColor))),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          label: const Text(
                                              'Ücret (Ücretsiz İse 0 Olarak Bırakınız)'),
                                          labelStyle: const TextStyle(
                                              color: Colors.black),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                  color: Colors.grey)),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: constants
                                                      .color.generalColor)),
                                          errorBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: constants
                                                      .color.errorColor)),
                                          focusedErrorBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide:
                                                  BorderSide(color: constants.color.errorColor))),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          label: const Text(
                                              'Maksimum Katılımcı Sayısı (Sınırsız İse 0 Olarak Bırakınız)'),
                                          labelStyle: const TextStyle(
                                              color: Colors.black),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                  color: Colors.grey)),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: constants
                                                      .color.generalColor)),
                                          errorBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: constants
                                                      .color.errorColor)),
                                          focusedErrorBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide:
                                                  BorderSide(color: constants.color.errorColor))),
                                    ),
                                  ),
                                  Obx(
                                    () => Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        width: Get.width,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12, vertical: 4),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color:
                                                  constants.color.generalColor),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton<City>(
                                            dropdownColor: Colors.white,
                                            hint: const Text("Şehir Seçiniz"),
                                            value:
                                                controller.selectedCity.value,
                                            onChanged: (City? newValue) {
                                              controller.selectedDistrict
                                                  .value = null;
                                              controller.selectedCity.value =
                                                  newValue;
                                              controller.tempDistricts.value =
                                                  controller.disctricts.value
                                                      .where((d) =>
                                                          d.cityId ==
                                                          newValue?.id)
                                                      .toList();
                                            },
                                            items: controller.cities
                                                .map<DropdownMenuItem<City>>(
                                                    (City city) {
                                              return DropdownMenuItem<City>(
                                                value: city,
                                                child: Text(city.name),
                                              );
                                            }).toList(),
                                            focusColor: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Obx(
                                    () => Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        width: Get.width,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12, vertical: 4),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color:
                                                  constants.color.generalColor),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton<District>(
                                            dropdownColor: Colors.white,
                                            hint: const Text("İlçe Seçiniz"),
                                            value: controller
                                                .selectedDistrict.value,
                                            onChanged: controller.tempDistricts
                                                    .value.isNotEmpty
                                                ? (District? newValue) {
                                                    controller.selectedDistrict
                                                        .value = newValue;
                                                  }
                                                : null,
                                            items: controller.tempDistricts.map<
                                                    DropdownMenuItem<District>>(
                                                (District district) {
                                              return DropdownMenuItem<District>(
                                                value: district,
                                                child: Text(district.name),
                                              );
                                            }).toList(),
                                            focusColor: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          label: const Text('Açık Adres'),
                                          labelStyle: const TextStyle(
                                              color: Colors.black),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                  color: Colors.grey)),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: constants
                                                      .color.generalColor)),
                                          errorBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: constants
                                                      .color.errorColor)),
                                          focusedErrorBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: constants.color.errorColor))),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      controller:
                                          controller.dateController.value,
                                      decoration: InputDecoration(
                                          suffixIcon: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 20),
                                            child: IconButton(
                                              icon: const Icon(
                                                Icons.calendar_today,
                                                color: Colors.black,
                                              ),
                                              onPressed: () => controller
                                                  .selectDate(context),
                                            ),
                                          ),
                                          label: const Text('Başlangıç Tarihi'),
                                          labelStyle: const TextStyle(
                                              color: Colors.black),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: const BorderSide(
                                                  color: Colors.grey)),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: constants
                                                      .color.generalColor)),
                                          errorBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: constants
                                                      .color.errorColor)),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: BorderSide(
                                                      color: constants
                                                          .color.errorColor))),
                                      readOnly:
                                          true, // Kullanıcının klavye ile giriş yapmasını engeller
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                        controller:
                                            controller.timeController.value,
                                        decoration: InputDecoration(
                                            suffixIcon: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 20),
                                              child: IconButton(
                                                icon: const Icon(
                                                  Icons.access_time,
                                                  color: Colors.black,
                                                ),
                                                onPressed: () => controller
                                                    .selectTime(context),
                                              ),
                                            ),
                                            label:
                                                const Text('Başlangıç Saati'),
                                            labelStyle: const TextStyle(
                                                color: Colors.black),
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: const BorderSide(
                                                    color: Colors.grey)),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: BorderSide(
                                                    color: constants
                                                        .color.generalColor)),
                                            errorBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: BorderSide(
                                                    color: constants
                                                        .color.errorColor)),
                                            focusedErrorBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: BorderSide(
                                                    color: constants
                                                        .color.errorColor))),
                                        readOnly: true),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          minimumSize: Size(Get.width * .7, 50),
                                          backgroundColor:
                                              constants.color.generalColor),
                                      child: Text(
                                        'Kaydet'.toUpperCase(),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }),
          )
        ],
      ),
    );
  }
}
