import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:project/models/user.dart';

class StorageService {
  static final _instance = StorageService._internal();
  factory StorageService() => _instance;
  StorageService._internal();

  final _myBox = Hive.box('myBox');

  void WriteData(String key, String data) {
    _myBox.put(key, data);
  }

  String ReadData(String key) {
    try {
      return _myBox.get(key);
    } catch (e) {
      return '';
    }
  }

  void DeleteData(String key) {
    _myBox.delete(key);
  }

  Future<User?> refreshPage() async {
    Map<String, dynamic> userMap = jsonDecode(ReadData('activityLoginInfo'));
    return User.fromJson(userMap);
  }
}
