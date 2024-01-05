import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tugas_dari_gnt/components/config/app_route.dart';
import 'package:tugas_dari_gnt/features/auth/presentation/login/login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _content(context),
    );
  }

  Widget _content(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: SingleChildScrollView(
        child: GetBuilder<LoginController>(builder: (ctrl) {
          return Column(
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
                  "Silahkan login untuk melanjutkan",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF597393)),
                ),
              ),
              _image(context),
              _email(),
              const SizedBox(
                height: 30,
              ),
              _password(),
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
                    "Belum punya akun ?",
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
                      onTap: () => Get.toNamed(AppRoute.regusterScreen),
                      child: const Text(
                        "Daftar sekarang",
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
              )
            ],
          );
        }),
      ),
    );
  }

  Widget _button() {
    return GetBuilder<LoginController>(builder: (ctrl) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          decoration: ShapeDecoration(
            color: ctrl.isReadyLogin
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
              onTap: ctrl.isReadyLogin ? () => ctrl.onPressLogin() : () {},
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
                          "Login",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 20,
                      bottom: 0,
                      child: Icon(
                        Icons.arrow_forward,
                        size: 24,
                        color: Colors.white,
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

  Widget _email() {
    return GetBuilder<LoginController>(builder: (ctrl) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Email",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF002060)),
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
                controller: ctrl.emailCtr,
                keyboardType: TextInputType.text,
                textAlignVertical: TextAlignVertical.center,
                textCapitalization: TextCapitalization.none,
                style: const TextStyle(
                  color: Color(0xFF002060),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
                decoration: const InputDecoration(
                  isDense: true,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                  hintText: 'Masukan email anda',
                ),
              ),
            )
          ],
        ),
      );
    });
  }

  Widget _password() {
    return GetBuilder<LoginController>(builder: (ctrl) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Password",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF002060)),
                ),
                Spacer(),
                Text(
                  "Lupa Password anda ?",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF597393)),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(
                  top: 15, bottom: 15, right: 15, left: 20),
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
                textAlignVertical: TextAlignVertical.center,
                style: const TextStyle(
                  color: Color(0xFF002060),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
                obscureText: true,
                controller: ctrl.passwordCtr,
                textCapitalization: TextCapitalization.none,
                decoration: InputDecoration(
                  isDense: true,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                  hintText: 'Masukkan password anda',
                  suffixIconConstraints: const BoxConstraints(minHeight: 0),
                  suffixIcon: SizedBox(
                    child: InkWell(
                      onTap: () {},
                      child: SvgPicture.asset(
                        "assets/images/eye.svg",
                        width: 20,
                        height: 20,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    });
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
