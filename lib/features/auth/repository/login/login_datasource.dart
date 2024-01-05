import 'package:tugas_dari_gnt/components/base/base_dio_datasource.dart';
import 'package:tugas_dari_gnt/components/ext/dio_ext.dart';
import 'package:tugas_dari_gnt/features/auth/model/login/login_request_model.dart';
import 'package:tugas_dari_gnt/features/auth/model/register/register_request_model.dart';

class LoginDataSource extends BaseDioDataSource {
  LoginDataSource(super.client);

  Future<String> apiLogin(LoginRequestModel model) {
    String path = '/login';
    return post<String>(path, data: model.toJson()).load();
  }

  Future<String> apiRegister(RegisterRequestModel model) {
    String path = '/register';
    return post<String>(path, data: model.toJson()).load();
  }
}
