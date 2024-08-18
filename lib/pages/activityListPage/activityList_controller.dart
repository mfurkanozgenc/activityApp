import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:project/base/base_state.dart';
import 'package:project/models/city.dart';
import 'package:project/models/district.dart';

class ActivityListController extends GetxController with BaseState {
  RxList<City> cities = <City>[].obs;
  final Rx<City?> selectedCity = Rx<City?>(null);

  RxList<District> disctricts = <District>[].obs;
  RxList<District> tempDistricts = <District>[].obs;
  final Rx<District?> selectedDistrict = Rx<District?>(null);

  Rx<DateTime> selectedDate = DateTime.now().obs;
  Rx<TimeOfDay> selectedTime = TimeOfDay.now().obs;

  RxString selectedPhoto = ''.obs;

  Rx<TextEditingController> dateController = TextEditingController().obs;
  Rx<TextEditingController> timeController = TextEditingController().obs;

  @override
  Future<void> onInit() async {
    cities.value = await services.action.loadCities();
    disctricts.value = await services.action.loadDisctricts();
    super.onInit();
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
    );
    if (pickedDate != null) {
      dateController.value.text = DateFormat('dd-MM-yyyy').format(pickedDate);
    }
  }

  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      },
    );

    if (pickedTime != null) {
      // Saati HH:mm formatında string olarak düzenleme
      String formattedTime =
          "${pickedTime.hour.toString().padLeft(2, '0')}:${pickedTime.minute.toString().padLeft(2, '0')}";
      timeController.value.text = formattedTime;
    }
  }
}
