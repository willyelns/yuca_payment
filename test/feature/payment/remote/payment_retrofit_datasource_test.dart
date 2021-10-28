import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yuca_payment/features/payment/data/models/payment_details_model.dart';
import 'package:yuca_payment/features/payment/data/models/payment_model.dart';
import 'package:yuca_payment/features/payment/remote/payment_retrofit_datasource.dart';

import '../../../fixtures/fixture_reader.dart';
import '../../../http_mock/mock_adapter.dart';

void main() {
  late Dio dio;
  late PaymentRetrofitDataSource sut;

  Future<ResponseBody> _mockHttpController(String path) async {
    switch (path) {
      case '/payments':
        final data = fixtureFeature('payment', 'payment_list.json');
        return ResponseBody.fromString(data, 200, headers: {
          Headers.contentTypeHeader: [Headers.jsonContentType],
        });
      default:
        return ResponseBody.fromString('', 404);
    }
  }

  setUp(() {
    dio = Dio();
    dio.httpClientAdapter = MockAdapter(mockMethod: _mockHttpController);
    sut = PaymentRetrofitDataSource(dio, baseUrl: MockAdapter.mockBase);
  });

  group('retrieve payment list', () {
    final expected = [
      PaymentModel(
        status: 'open',
        value: 3100,
        dueDate: '01/09/2020',
        effectiveDate: '01/08/2020',
        details: [
          PaymentDetailsModel(descripton: 'Pacote Yuca', value: 2600),
          PaymentDetailsModel(descripton: 'Multa por Atraso', value: -90),
          PaymentDetailsModel(
              descripton: 'ServiÃ§o adicional kit 30 marmitas', value: 410),
        ],
      ),
      PaymentModel(
        status: 'closed',
        value: 2600,
        dueDate: '01/08/2020',
        effectiveDate: '01/07/2020',
        details: [
          PaymentDetailsModel(descripton: 'Pacote Yuca', value: 2600),
        ],
      ),
      PaymentModel(
        status: 'paid',
        value: 3260,
        dueDate: '01/07/2020',
        effectiveDate: '01/06/2020',
        details: [
          PaymentDetailsModel(descripton: 'Pacote Yuca', value: 2600),
          PaymentDetailsModel(descripton: 'Multa por Atraso', value: -90),
          PaymentDetailsModel(
              descripton: 'ServiÃ§o adicional kit 30 marmitas', value: 410),
          PaymentDetailsModel(
              descripton: 'ServiÃ§o adicional de limpeza padrÃ£o - 3h',
              value: 90),
          PaymentDetailsModel(
              descripton: 'ServiÃ§o adicional de limpeza padrÃ£o - 8h',
              value: 150),
          PaymentDetailsModel(
              descripton: 'ServiÃ§o adicional Vivo Super HD', value: 100),
        ],
      ),
    ];

    test('should return a Payment list from the API call', () async {
      final result = await sut.retrievePaymentList();
      expect(expected, result);
    });
  });
}
