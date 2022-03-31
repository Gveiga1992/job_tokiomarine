import 'package:get/get.dart';
import 'package:job_vitoria_desafio/controller/controller_login.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
