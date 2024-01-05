import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConst {
  static String appName = "";
  static bool isDebuggable = true;
  static String appUrl = "${dotenv.env['API_LINK']!}/api";
}