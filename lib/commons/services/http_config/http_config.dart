import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class HttpConfigService {
  HttpConfigService({
    required Logger logger,
    required String baseUrl,
  })  : _logger = logger,
        _baseUrl = baseUrl;

  final Logger _logger;
  final String _baseUrl;
  late final Dio _dio;

  Dio get appDioInstance {
    return _createDio();
  }

  Dio _createDio() {
    _dio = Dio(
      BaseOptions(
        baseUrl: _baseUrl,
      ),
    );
    _addInterceptors();
    _logger.v('The default Interceptor was added');
    return _dio;
  }

  void _addInterceptors() {
    _dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
      ),
    );
  }
}
