import 'package:project/models/user.dart';

class DbService {
  static final _instance = DbService._internal();
  factory DbService() => _instance;
  DbService._internal();

  late User loginUser = User(
      userName: '',
      fullName: '',
      password: '',
      image: '',
      identificationNumber: '',
      phoneNumber: '',
      date: 0,
      userType: 0,
      id: '');
}
