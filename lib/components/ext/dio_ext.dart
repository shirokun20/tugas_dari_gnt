import 'package:dio/dio.dart';

extension DioExt<T> on Future<Response<T>> {

  Future<T> load() {
    return then((value) => value.data!);
  }

  Future<T?> loadOrNull() {
    return then((value) => value.data);
  }
}