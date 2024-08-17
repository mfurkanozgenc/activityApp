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
    );
  }
}
