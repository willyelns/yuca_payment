import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../data/models/payment_model.dart';

part 'payment_retrofit_datasource.g.dart';

@RestApi()
abstract class PaymentRetrofitDataSource {
  factory PaymentRetrofitDataSource(
    Dio dio, {
    String? baseUrl,
  }) = _PaymentRetrofitDataSource;

  @GET('/payments')
  Future<List<PaymentModel>> retrievePaymentList();
}
