import 'package:get/get.dart';
import 'package:tugas_dari_gnt/components/util/network.dart';
import 'package:tugas_dari_gnt/features/auth/presentation/register/register_controller.dart';
import 'package:tugas_dari_gnt/features/auth/repository/login/login_datasource.dart';
import 'package:tugas_dari_gnt/features/auth/repository/login/login_respository.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginDataSource(Network.dioClient()));
    Get.lazyPut(() => LoginRepository(Get.find()));
    Get.lazyPut(() => RegisterController(Get.find()));
  }
}