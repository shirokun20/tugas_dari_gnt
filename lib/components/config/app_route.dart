// ignore_for_file: unused_import

import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:tugas_dari_gnt/features/auth/binding/login_binding.dart';
import 'package:tugas_dari_gnt/features/auth/binding/register_binding.dart';
import 'package:tugas_dari_gnt/features/auth/presentation/register/register_screen.dart';
import 'package:tugas_dari_gnt/features/home/binding/home_binding.dart';
import 'package:tugas_dari_gnt/features/home/presentation/home_screen.dart';
import '../../features/auth/presentation/login/login_screen.dart';
import '../../main.dart';

class AppRoute {
  static const String notFound = '/notFound';
  static const String loginScreen = '/loginScreen';
  static const String homeScreen = '/homeScreen';
  static const String regusterScreen = '/registerScreen';
  static List<GetPage> pages = [
    GetPage(
        name: loginScreen,
        page: () => const LoginScreen(),
        binding: LoginBinding()),
    GetPage(
        name: homeScreen,
        page: () => const HomeScreen(),
        binding: HomeBinding()),
    GetPage(
        name: regusterScreen,
        page: () => const RegisterScreen(),
        binding: RegisterBinding()),
  ];
}
