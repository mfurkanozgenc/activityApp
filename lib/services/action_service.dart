import 'package:cloud_firestore/cloud_firestore.dart';

class ActionService {
  static final _instance = ActionService._internal();
  ActionService._internal();

  late CollectionReference activityResponse;
  late CollectionReference userResponse;

  factory ActionService() {
    _instance.activityResponse =
        FirebaseFirestore.instance.collection('activities');
    _instance.userResponse = FirebaseFirestore.instance.collection('users');
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
    print(userNameControl.docs);

    if (userNameControl.docs.isNotEmpty) {
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
          .where('userType', isNotEqualTo: type)
          .get();
      if (controlIdentificationNumber.docs.isNotEmpty) {
        return 'Aynı Kimilk Numarasına Ait Kayıt Bulunmaktadır';
      }
      var controlPhoneNumber = await userResponse
          .where('phoneNumber', isEqualTo: phoneNumber)
          .where('userType', isNotEqualTo: type)
          .get();

      if (controlPhoneNumber.docs.isNotEmpty) {
        return 'Aynı Telefon Numarasına Ait Kayıt Bulunmaktadır';
      }
      var controlUserName = await userResponse
          .where('userName', isEqualTo: userName)
          .where('userType', isNotEqualTo: type)
          .get();
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
}
