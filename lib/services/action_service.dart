import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:project/models/city.dart';
import 'package:project/models/district.dart';
import 'package:project/models/user.dart';
import 'package:project/services/db_Service.dart';
import 'package:project/services/storage_service.dart';

class ActionService {
  static final _instance = ActionService._internal();
  ActionService._internal();

  late CollectionReference activityResponse;
  late CollectionReference userResponse;
  late StorageService storage;
  late DbService db;

  factory ActionService() {
    _instance.activityResponse =
        FirebaseFirestore.instance.collection('activities');
    _instance.userResponse = FirebaseFirestore.instance.collection('users');
    _instance.storage = StorageService();
    _instance.db = DbService();
    return _instance;
  }

  Future<bool> addActivity() async {
    try {
      await activityResponse.add({
        'name': 'Mustafa Furkan Özgenç',
        'date': DateTime.now().microsecondsSinceEpoch
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> login(String userNameOrPhoneNumber, String password) async {
    var userNameControl = await userResponse
        .where('userName', isEqualTo: userNameOrPhoneNumber)
        .where('password', isEqualTo: password)
        .get();

    if (userNameControl.docs.isNotEmpty) {
      var userDoc = userNameControl.docs.first;
      var loginUser = User.fromFirestore(userDoc);
      String userJson = jsonEncode(loginUser!.toJson());
      storage.WriteData('activityLoginInfo', userJson!);
      db.loginUser = loginUser;
      return true;
    }
    return false;
  }

  Future<String> addUser(
      String fullName,
      String phoneNumber,
      String identificationNumber,
      String userName,
      String password,
      String image,
      int type) async {
    try {
      var controlIdentificationNumber = await userResponse
          .where('identificationNumber', isEqualTo: identificationNumber)
          .get();
      if (controlIdentificationNumber.docs.isNotEmpty) {
        return 'Aynı Kimilk Numarasına Ait Kayıt Bulunmaktadır';
      }
      var controlPhoneNumber =
          await userResponse.where('phoneNumber', isEqualTo: phoneNumber).get();

      if (controlPhoneNumber.docs.isNotEmpty) {
        return 'Aynı Telefon Numarasına Ait Kayıt Bulunmaktadır';
      }
      var controlUserName =
          await userResponse.where('userName', isEqualTo: userName).get();
      if (controlUserName.docs.isNotEmpty) {
        return 'Aynı Kullanıcı Adına Ait Kayıt Bulunmaktadır';
      }
      await userResponse.add({
        'fullName': fullName,
        'phoneNumber': phoneNumber,
        'identificationNumber': identificationNumber,
        'userName': userName,
        'password': password,
        'image': image,
        'userType': type,
        'date': DateTime.now().microsecondsSinceEpoch
      });
      return 'success';
    } catch (e) {
      print('HATA : $e');
      return 'error';
    }
  }

  Future<List<City>> loadCities() async {
    final String response =
        await rootBundle.loadString('assets/jsons/cities.json');
    final data = await json.decode(response);
    List<City> cityList = (data as List).map((i) => City.fromJson(i)).toList();
    return cityList;
  }

  Future<List<District>> loadDisctricts() async {
    final String response =
        await rootBundle.loadString('assets/jsons/districts.json');
    final data = await json.decode(response);
    List<District> districtList =
        (data as List).map((i) => District.fromJson(i)).toList();
    return districtList;
  }
}
