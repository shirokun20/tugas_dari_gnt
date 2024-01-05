// import 'package:logger/logger.dart';
import 'package:tugas_dari_gnt/components/base/base_repository.dart';
import 'package:tugas_dari_gnt/components/util/state.dart';
import 'package:tugas_dari_gnt/features/auth/model/login/login_request_model.dart';
import 'package:tugas_dari_gnt/features/auth/model/login/login_response_model.dart';
import 'package:tugas_dari_gnt/features/auth/model/register/register_request_model.dart';
import 'package:tugas_dari_gnt/features/auth/model/register/register_response_model.dart';
import 'package:tugas_dari_gnt/features/auth/repository/login/login_datasource.dart';

class LoginRepository extends BaseRepository {
  final LoginDataSource _dataSource;
  // final _logger = Logger();
  LoginRepository(this._dataSource);

  void loadLogin({
    required LoginRequestModel? dataReq,
    required ResponseHandler<LoginResponseModel?> response,
  }) async {
    try {
      final data =
          await _dataSource.apiLogin(dataReq!).then(mapToData).then((value) {
        final response = LoginResponseModel.fromJson(value);
        return response;
      });
      response.onSuccess.call(data);
      response.onDone.call();
    } catch (e, _) {
      // _logger.e(e);
      // _logger.i(trace);
      response.onFailed(e, e.toString());
      response.onDone.call();
    }
  }

  void loadRegister({
    required RegisterRequestModel? dataReq,
    required ResponseHandler<RegisterResponseModel?> response,
  }) async {
    try {
      final data =
          await _dataSource.apiRegister(dataReq!).then(mapToData).then((value) {
        final response = RegisterResponseModel.fromJson(value);
        return response;
      });
      response.onSuccess.call(data);
      response.onDone.call();
    } catch (e, _) {
      // _logger.e(e);
      // _logger.i(trace);
      response.onFailed(e, e.toString());
      response.onDone.call();
    }
  }
}
