import 'package:get/get.dart';
import 'package:tugas_dari_gnt/features/home/presentation/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(Get.find()), fenix: true);
  }
}