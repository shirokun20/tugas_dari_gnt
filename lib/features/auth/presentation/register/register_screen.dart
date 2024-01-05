import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_dari_gnt/features/auth/presentation/register/register_controller.dart';

class RegisterScreen extends GetView<RegisterController> {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _content(context),
    );
  }

  Widget _content(BuildContext context) {
    return GetBuilder<RegisterController>(
      builder: (ctrl) {
        return Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 100,
                ),
                _welocomeWidget(),
                const SizedBox(
                  height: 15,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Silahkan register untuk bisa akses aplikasi ini",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(
                          0xFF597393,
                        )),
                  ),
                ),
                _image(context),
                _input(
                  padding: 20,
                  label: "Staff ID",
                  hintText: "Staff ID",
                  isRequired: true,
                  errorText: ctrl.errorTextStaffID,
                  controller: ctrl.staffID,
                ),
                const SizedBox(
                  height: 30,
                ),
                _input(
                  padding: 20,
                  label: "Staff Name",
                  hintText: "Staff Name",
                  isRequired: true,
                  errorText: ctrl.errorTextStaffName,
                  controller: ctrl.staffName,
                ),
                const SizedBox(
                  height: 30,
                ),
                _input(
                  padding: 20,
                  label: "Hobby",
                  hintText: "Hobby",
                  controller: ctrl.hobby,
                  isRequired: false,
                ),
                const SizedBox(
                  height: 30,
                ),
                _password(
                  hintText: "Password",
                  isRequired: true,
                  errorText: ctrl.errorTextPassword,
                  controller: ctrl.password,
                ),
                const SizedBox(
                  height: 30,
                ),
                _password(
                  label: "Confirm Password",
                  isRequired: true,
                  hintText: "Confirm password",
                  errorText: ctrl.errorTextCPassword,
                  controller: ctrl.cpassword,
                ),
                const SizedBox(
                  height: 65,
                ),
                _button(),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Sudah punya akun ?",
                      style: TextStyle(
                        color: Color(0xFFBEBEBE),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () => Get.back(),
                        child: const Text(
                          "Login sekarang",
                          style: TextStyle(
                            color: Color(0xFF002060),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.copyright,
                      size: 16,
                      color: Color(0xFFBEBEBE),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'SILK. all right reserved.',
                      style: TextStyle(
                        color: Color(0xFFBEBEBE),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        );
      }
    );
  }

  Widget _button() {
    return GetBuilder<RegisterController>(builder: (ctrl) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          decoration: ShapeDecoration(
            color: ctrl.isReadyRegister
                ? const Color(0xFF002060)
                : const Color(0xFF002060).withOpacity(0.5),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            shadows: const [
              BoxShadow(
                color: Color(0x3D1D334F),
                blurRadius: 24,
                offset: Offset(0, 16),
                spreadRadius: 0,
              )
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: ctrl.isReadyRegister ? () => ctrl.onPressRegister() : () {},
              borderRadius: BorderRadius.circular(8),
              child: const SizedBox(
                width: double.infinity,
                height: 50,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      right: 0,
                      top: 0,
                      bottom: 0,
                      child: Center(
                        child: Text(
                          "Register",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget _image(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 280,
      width: width,
      child: Stack(
        children: [
          Positioned(
            right: -70,
            top: 0,
            bottom: 0,
            child: Image.asset(
              "assets/images/login_image_2.png",
              width: width,
              height: 280,
            ),
          )
        ],
      ),
    );
  }

  Widget _input({
    double padding = 20,
    String label = "",
    String hintText = "",
    bool isRequired = false,
    String? errorText,
    TextEditingController? controller,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF002060)),
              ),
              const SizedBox(
                width: 5,
              ),
              isRequired
                  ? const Text(
                      "*",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.red),
                    )
                  : const SizedBox(),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              shadows: const [
                BoxShadow(
                  color: Color(0x28BEBEBE),
                  blurRadius: 24,
                  offset: Offset(0, 16),
                  spreadRadius: 0,
                )
              ],
            ),
            child: TextFormField(
              controller: controller,
              keyboardType: TextInputType.text,
              textAlignVertical: TextAlignVertical.center,
              textCapitalization: TextCapitalization.none,
              style: const TextStyle(
                color: Color(0xFF002060),
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
              decoration: InputDecoration(
                isDense: true,
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
                suffixIconConstraints: const BoxConstraints(minHeight: 0),
                hintText: hintText,
              ),
            ),
          ),
          errorText != null
              ? Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Text(
                    errorText,
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }

  Widget _password({
    String label = "Password",
    String hintText = "Masukkan password anda",
    bool isRequired = false,
    String? errorText,
    TextEditingController? controller,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                label,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF002060)),
              ),
              const SizedBox(
                width: 5,
              ),
              isRequired
                  ? const Text(
                      "*",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.red),
                    )
                  : const SizedBox()
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            width: double.infinity,
            padding:
                const EdgeInsets.only(top: 15, bottom: 15, right: 15, left: 20),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              shadows: const [
                BoxShadow(
                  color: Color(0x28BEBEBE),
                  blurRadius: 24,
                  offset: Offset(0, 16),
                  spreadRadius: 0,
                )
              ],
            ),
            child: TextFormField(
              controller: controller,
              textAlignVertical: TextAlignVertical.center,
              style: const TextStyle(
                color: Color(0xFF002060),
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
              obscureText: true,
              textCapitalization: TextCapitalization.none,
              decoration: InputDecoration(
                isDense: true,
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
                hintText: hintText,
              ),
            ),
          ),
          errorText != null
              ? Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Text(
                    errorText,
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }

  Widget _welocomeWidget() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Text(
            "Hai, ",
            style: TextStyle(
                color: Color(0xFF1D334F),
                fontSize: 28,
                fontWeight: FontWeight.w600),
          ),
          Text(
            "Selamat Datang",
            style: TextStyle(
                color: Color(0xFF1D334F),
                fontSize: 28,
                fontWeight: FontWeight.w800),
          ),
        ],
      ),
    );
  }
}
