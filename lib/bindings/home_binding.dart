import 'package:get/get.dart';
import 'package:job_vitoria_desafio/controller/controller_home.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
