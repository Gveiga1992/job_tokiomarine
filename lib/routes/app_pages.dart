import 'package:get/get.dart';
import 'package:job_vitoria_desafio/bindings/binding_login.dart';
import 'package:job_vitoria_desafio/ui/home_screen.dart';
import 'package:job_vitoria_desafio/ui/initial_page.dart';

import '../bindings/home_binding.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
        name: Routes.INITIAL,
        page: () => LoginPage(),
        binding: LoginBinding(),
        transition: Transition.zoom),
    GetPage(
        name: Routes.HOME,
        page: () => HomeScreen(),
        binding: HomeBinding(),
        transition: Transition.fade),
  ];
}
