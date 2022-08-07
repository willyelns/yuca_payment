// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_retrofit_datasource.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _PaymentRetrofitDataSource implements PaymentRetrofitDataSource {
  _PaymentRetrofitDataSource(this._dio, {this.baseUrl});

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<PaymentModel>> retrievePaymentList() async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, dynamic>{};
    final data = <String, dynamic>{};
    final result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<PaymentModel>>(
            Options(method: 'GET', headers: headers, extra: extra)
                .compose(_dio.options, '/payments',
                    queryParameters: queryParameters, data: data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = result.data!
        .map((dynamic i) => PaymentModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
