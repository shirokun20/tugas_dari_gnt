import 'package:get/get.dart';
import 'package:tugas_dari_gnt/components/config/app_route.dart';
import 'package:tugas_dari_gnt/components/util/storage_util.dart';

class HomeController extends GetxController {
  final StorageUtil _storageUtil;
  String token = "";

  HomeController(this._storageUtil);

  @override
  void onInit() async {
    final data = await _storageUtil.getToken();
    token = "$data";
    update();
    super.onInit();
  }

  void onLogoutClicked() async {
    await _storageUtil.removeAll();
    Get.offNamedUntil(AppRoute.loginScreen, (route) => false);
  }
}