import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/base/base_state.dart';
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
          child: Obx(
        () => Container(
          width: Get.width,
          height: Get.height * .3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            image: DecorationImage(
                image: MemoryImage(
                    base64Decode(controller!.loginUser!.value!.image))),
          ),
        ),
      )),
    );
  }
}
