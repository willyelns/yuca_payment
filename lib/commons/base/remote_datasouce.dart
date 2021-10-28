import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../errors/exceptions/exceptions.dart' show ServerException;

abstract class RemoteDataSource {
  @protected
  Future<T> handleException<T>(
    Future<T> Function() method, {
    required String errorMessage,
  }) async {
    try {
      return await method();
    } on DioError catch (e) {
      debugPrint(e.toString());
      throw ServerException(message: errorMessage);
    } on Object catch (e) {
      debugPrint(e.toString());
      throw ServerException(message: errorMessage);
    }
  }
}
