import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/base/base_state.dart';
import 'package:project/models/city.dart';
import 'package:project/models/district.dart';
import 'package:project/pages/HomePage/home_controller.dart';

// ignore: use_key_in_widget_constructors
class HomeView extends GetView<HomeController> with BaseState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Etkinlikler'.toUpperCase(),
          style: TextStyle(color: constants.color.textColor),
        ),
        centerTitle: true,
        backgroundColor: constants.color.generalColor,
      ),
      body: Center(
          child: Column(
        children: [
          Obx(() => Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        border: Border.all(color: constants.color.generalColor),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<City>(
                          dropdownColor: Colors.white,
                          hint: const Text("Şehir Seçiniz"),
                          value: controller.selectedCity.value,
                          onChanged: (City? newValue) {
                            controller.selectedDistrict.value = null;
                            controller.selectedCity.value = newValue;
                            controller.tempDistricts.value = controller
                                .disctricts.value
                                .where((d) => d.cityId == newValue?.id)
                                .toList();
                          },
                          items: controller.cities
                              .map<DropdownMenuItem<City>>((City city) {
                            return DropdownMenuItem<City>(
                              value: city,
                              child: Text(city.name),
                            );
                          }).toList(),
                          focusColor: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        border: Border.all(color: constants.color.generalColor),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<District>(
                          dropdownColor: Colors.white,
                          hint: const Text("İlçe Seçiniz"),
                          value: controller.selectedDistrict.value,
                          onChanged: controller.tempDistricts.value.length > 0
                              ? (District? newValue) {
                                  controller.selectedDistrict.value = newValue;
                                }
                              : null,
                          items: controller.tempDistricts
                              .map<DropdownMenuItem<District>>(
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
                  ],
                ),
              ))
        ],
      )),
    );
  }
}
