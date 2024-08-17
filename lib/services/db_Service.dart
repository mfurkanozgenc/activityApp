class DbService {
  static final _instance = DbService._internal();
  factory DbService() => _instance;
  DbService._internal();
}
