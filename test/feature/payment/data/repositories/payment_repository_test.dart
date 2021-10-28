import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:yuca_payment/commons/errors/exceptions/server_exception.dart';
import 'package:yuca_payment/commons/errors/failures/server_failure.dart';
import 'package:yuca_payment/commons/types/use_case_response.dart';
import 'package:yuca_payment/features/payment/data/datasources/payment_datasource.dart';
import 'package:yuca_payment/features/payment/data/repositories/payment_repository_impl.dart';
import 'package:yuca_payment/features/payment/domain/entities/payment.dart';
import 'package:yuca_payment/features/payment/domain/entities/payment_details.dart';
import 'package:yuca_payment/features/payment/domain/repositories/payment_repository.dart';
import 'package:yuca_payment/features/payment/shared/enums/payment_status.dart';

class MockPaymentRemoteDataSource extends Mock
    implements PaymentRemoteDataSource {}

void main() {
  late PaymentRepository sut;
  late MockPaymentRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockPaymentRemoteDataSource();

    sut = PaymentRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
    );
  });

  group('Retrieve payment list', () {
    final paymentList = [
      Payment(
        status: PaymentStatus.open,
        value: 3100,
        dueDate: '01/09/2020',
        effectiveDate: '01/08/2020',
        details: [
          PaymentDetails(description: 'Pacote Yuca', value: 2600),
          PaymentDetails(description: 'Multa por Atraso', value: -90),
          PaymentDetails(
              description: 'ServiÃ§o adicional kit 30 marmitas', value: 410),
        ],
      ),
      Payment(
        status: PaymentStatus.closed,
        value: 2600,
        dueDate: '01/08/2020',
        effectiveDate: '01/07/2020',
        details: [
          PaymentDetails(description: 'Pacote Yuca', value: 2600),
        ],
      ),
      Payment(
        status: PaymentStatus.paid,
        value: 3260,
        dueDate: '01/07/2020',
        effectiveDate: '01/06/2020',
        details: [
          PaymentDetails(description: 'Pacote Yuca', value: 2600),
          PaymentDetails(description: 'Multa por Atraso', value: -90),
          PaymentDetails(
              description: 'ServiÃ§o adicional kit 30 marmitas', value: 410),
          PaymentDetails(
              description: 'ServiÃ§o adicional de limpeza padrÃ£o - 3h',
              value: 90),
          PaymentDetails(
              description: 'ServiÃ§o adicional de limpeza padrÃ£o - 8h',
              value: 150),
          PaymentDetails(
              description: 'ServiÃ§o adicional Vivo Super HD', value: 100),
        ],
      ),
    ];

    test('should successfully retrieve the Payment list', () async {
      when(() => mockRemoteDataSource.retrievePaymentList())
          .thenAnswer((_) async => paymentList);

      final expected =
          await UseCaseResponseExtension.createSuccess<List<Payment>>(
              paymentList);
      final result = await sut.retrievePaymentList();

      expect(result, expected);
    });
    test(
        'should return a ServerFailure '
        'When an unknown exception happens while trying to get the payment list from a server',
        () async {
      when(() => mockRemoteDataSource.retrievePaymentList())
          .thenThrow(Exception());

      final result = await sut.retrievePaymentList();
      final expected =
          await UseCaseResponseExtension.createFailure<List<Payment>>(
              const ServerFailure());

      expect(result, expected);
    });
    test(
        'should return a ServerFailure '
        'when a ServerException happens while trying to get the payment list from a server',
        () async {
      when(() => mockRemoteDataSource.retrievePaymentList())
          .thenThrow(const ServerException());

      final result = await sut.retrievePaymentList();
      final expected =
          await UseCaseResponseExtension.createFailure<List<Payment>>(
              const ServerFailure());

      expect(result, expected);
    });
  });
}
