import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:tugas_dari_gnt/components/base/base_error_model.dart';
import 'package:tugas_dari_gnt/components/util/state.dart';
import 'package:tugas_dari_gnt/features/auth/model/register/register_request_model.dart';
import 'package:tugas_dari_gnt/features/auth/repository/login/login_respository.dart';

class RegisterController extends GetxController {
  final LoginRepository _repository;
  final _logger = Logger();

  final TextEditingController staffID = TextEditingController();
  final TextEditingController staffName = TextEditingController();
  final TextEditingController hobby = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController cpassword = TextEditingController();

  String? errorTextStaffID;
  String? errorTextStaffName;
  String? errorTextPassword;
  String? errorTextCPassword;

  bool isReadyRegister = false;

  RegisterController(this._repository);

  @override
  void onInit() {
    staffID.addListener(() {
      _validation();
    });
    staffName.addListener(() {
      _validation();
    });
    hobby.addListener(() {
      _validation();
    });
    password.addListener(() {
      _validation();
    });
    cpassword.addListener(() {
      _validation();
    });
    super.onInit();
  }

  _validation() {
    if (staffID.text.isEmpty) {
      isReadyRegister = false;
      errorTextStaffID = "Staff ID don't empty";
    } else {
      errorTextStaffID = null;
    }

    if (staffName.text.isEmpty) {
      isReadyRegister = false;
      errorTextStaffName = "Staff Name don't empty";
    } else {
      errorTextStaffName = null;
    }
    if (password.text.isEmpty) {
      isReadyRegister = false;
      errorTextPassword = "Password don't empty";
    } else {
      errorTextPassword = null;
    }
    if (cpassword.text.isEmpty) {
      isReadyRegister = false;
      errorTextCPassword = "Password don't empty";
    } else {
      errorTextCPassword = null;
    }
    if (cpassword.text != password.text) {
      isReadyRegister = false;
      errorTextCPassword = "Password & Confirm Password not match";
      errorTextPassword = "Password & Confirm Password not match";
    }

    if (staffID.text.isNotEmpty &&
        staffName.text.isNotEmpty &&
        password.text.isNotEmpty &&
        cpassword.text.isNotEmpty &&
        cpassword.text.isNotEmpty &&
        cpassword.text == password.text) {
      isReadyRegister = true;
    }
    update();
    // _logger.i("Hasil: $isReadyRegister");
  }

  void onPressRegister() {
    Get.snackbar(
      "Peringatan!",
      "Sedang Proses Register",
      colorText: Colors.white,
      backgroundColor: Colors.yellow[800],
      snackbarStatus: (status) {
        if (status == SnackbarStatus.CLOSED) _processRegister();
      }
    );
    // 
  }

  _processRegister() {
    _repository.loadRegister(
      dataReq: RegisterRequestModel(
        email: staffName.text,
        password: password.text,
      ),
      response: ResponseHandler(
        onSuccess: (res) {
          _logger.i(res?.toJson());
          // 
          Get.snackbar(
            "Info",
            "Hore, anda bisa login sekarang",
            colorText: Colors.white,
            backgroundColor: Colors.green,
            snackbarStatus: (status) {
              if (status == SnackbarStatus.CLOSED) Get.back();
            }
          );
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
