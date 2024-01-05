import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:tugas_dari_gnt/components/base/base_error_model.dart';
import 'package:tugas_dari_gnt/components/config/app_route.dart';
import 'package:tugas_dari_gnt/components/util/state.dart';
import 'package:tugas_dari_gnt/components/util/storage_util.dart';
import 'package:tugas_dari_gnt/features/auth/model/login/login_request_model.dart';
import 'package:tugas_dari_gnt/features/auth/repository/login/login_respository.dart';

class LoginController extends GetxController {
  final StorageUtil _storageUtil;
  final LoginRepository _repository;
  final _logger = Logger();

  final TextEditingController emailCtr = TextEditingController();
  final TextEditingController passwordCtr = TextEditingController();

  LoginController(this._storageUtil, this._repository);

  bool isReadyLogin = false;

  @override
  void onInit() async {
    await _checkUserHasLogin();
    emailCtr.addListener(() {
      _validation();
    });
    passwordCtr.addListener(() {
      _validation();
    });
    _logger.i("Halaman Login");
    super.onInit();
  }

  _checkUserHasLogin() async {
    final res = await _storageUtil.getToken();
    if (res != null) {
      Get.snackbar(
        "Info",
        "Wah, ternyata belum logout nih",
        colorText: Colors.white,
        backgroundColor: Colors.green,
        snackbarStatus: (status) {
          if (status == SnackbarStatus.CLOSED) {
            _toHome();
          }
        }
      );
    }
  }

  _toHome() {
    Get.offNamedUntil(AppRoute.homeScreen, (route) => false);
  }

  _validation() {
    if (emailCtr.text.isEmpty) {
      isReadyLogin = false;
    } else if (passwordCtr.text.isEmpty) {
      isReadyLogin = false;
    } else if (!emailCtr.text.isEmail) {
      isReadyLogin = false;
    } else {
      isReadyLogin = true;
    }
    update();
    // _logger.i("Hasil: $isReadyLogin");
  }

  @override
  void onClose() {
    emailCtr.dispose();
    passwordCtr.dispose();
  }

  void onPressLogin() {
    Get.snackbar(
      "Peringatan!",
      "Sedang Proses Login",
      colorText: Colors.white,
      backgroundColor: Colors.yellow[800],
      snackbarStatus: (status) {
        if (status == SnackbarStatus.CLOSED) _processLogin();
      }
    );
    // 
  }

  _processLogin() {
    _repository.loadLogin(
      dataReq: LoginRequestModel(
        email: emailCtr.text,
        password: passwordCtr.text,
      ),
      response: ResponseHandler(
        onSuccess: (res) {
          _logger.i(res?.toJson());
          // 
          Get.snackbar(
            "Info",
            "Hore, anda bisa masuk sekarang",
            colorText: Colors.white,
            backgroundColor: Colors.green,
            snackbarStatus: (status) {
              if (status == SnackbarStatus.CLOSED) _toHome();
            }
          );
          _storageUtil.setToken("${res?.token}");
          // 
        },
        onFailed: (responseError, message) {
          // 
          final String errorString = responseError.response!.data!;
          final output = BaseErrorModel.fromJson(jsonDecode(errorString));
          // 
          Get.snackbar(
            "Peringatan!",
            "${output.error}",
            colorText: Colors.white,
            backgroundColor: Colors.red,
          );
          // 
        },
        onDone: () {},
      ),
    );
  }
}
