
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:tugas_dari_gnt/components/util/network.dart';
import 'package:tugas_dari_gnt/features/auth/presentation/login/login_controller.dart';
import 'package:tugas_dari_gnt/features/auth/repository/login/login_datasource.dart';
import 'package:tugas_dari_gnt/features/auth/repository/login/login_respository.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController(Get.find(), Get.find()), fenix: true);
    Get.lazyPut(() => LoginDataSource(Network.dioClient()));
    Get.lazyPut(() => LoginRepository(Get.find()));
  }
}