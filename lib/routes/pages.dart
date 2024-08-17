import 'package:get/get.dart';
import 'package:project/pages/LoginPage/login_binding.dart';
import 'package:project/pages/LoginPage/login_view.dart';
import 'package:project/pages/HomePage/home_binding.dart';
import 'package:project/pages/HomePage/home_view.dart';
import 'package:project/pages/createPage/create_binding.dart';
import 'package:project/pages/createPage/create_view.dart';
import 'package:project/routes/routes.dart';

class Pages {
  static List<GetPage> pages = [
    GetPage(
        name: Routes.login, page: () => LoginView(), binding: LoginBinding()),
    GetPage(
        name: Routes.create,
        page: () => CreateView(),
        binding: CreateBinding()),
    GetPage(name: Routes.home, page: () => HomeView(), binding: HomeBinding()),
  ];
}
