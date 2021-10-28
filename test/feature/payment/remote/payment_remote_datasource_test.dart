import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:yuca_payment/commons/errors/exceptions/server_exception.dart';
import 'package:yuca_payment/features/payment/data/datasources/payment_datasource.dart';
import 'package:yuca_payment/features/payment/data/models/payment_details_model.dart';
import 'package:yuca_payment/features/payment/data/models/payment_model.dart';
import 'package:yuca_payment/features/payment/remote/payment_remote_datasource.dart';
import 'package:yuca_payment/features/payment/remote/payment_retrofit_datasource.dart';

class MockPaymentRetrofitDataSource extends Mock
    implements PaymentRetrofitDataSource {}

void main() {
  late PaymentRemoteDataSource sut;
  late MockPaymentRetrofitDataSource mockPaymentRetrofitDataSource;

  setUp(() {
    mockPaymentRetrofitDataSource = MockPaymentRetrofitDataSource();
    sut = PaymentRemoteDataSourceImpl(
      paymentRetrofitDataSource: mockPaymentRetrofitDataSource,
    );
  });

  group('Retrieve payment list', () {
    final paymentList = [
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
    test(
        'should throw a ServerException '
        'when an error occurs while trying to retrieve the payment list from the server',
        () async {
      when(() => mockPaymentRetrofitDataSource.retrievePaymentList())
          .thenThrow(Exception());

      final call = sut.retrievePaymentList;

      expect(call(), throwsA(const TypeMatcher<ServerException>()));
    });
    test(
        'should return a payment list '
        'when a payment list is successfully obtained from the server',
        () async {
      when(() => mockPaymentRetrofitDataSource.retrievePaymentList())
          .thenAnswer((_) async => paymentList);

      final result = await sut.retrievePaymentList();

      expect(result, paymentList);
    });
  });
}
