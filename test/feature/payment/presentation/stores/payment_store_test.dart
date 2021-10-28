import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:yuca_payment/commons/errors/failures/server_failure.dart';
import 'package:yuca_payment/commons/formatters/currency_formatter.dart';
import 'package:yuca_payment/commons/formatters/date_formatter.dart';
import 'package:yuca_payment/commons/types/use_case_response.dart';
import 'package:yuca_payment/features/payment/domain/entities/payment.dart';
import 'package:yuca_payment/features/payment/domain/entities/payment_details.dart';
import 'package:yuca_payment/features/payment/domain/usecases/retrieve_payment_list.dart';
import 'package:yuca_payment/features/payment/presentation/stores/payment_store.dart';
import 'package:yuca_payment/features/payment/shared/enums/payment_status.dart';

class MockRetrievePaymentList extends Mock implements RetrievePaymentList {}

class MockDateFormatter extends Mock implements DateFormatter {}

class MockCurrencyFormatter extends Mock implements CurrencyFormatter {}

void main() {
  late PaymentStore sut;

  late MockRetrievePaymentList mockRetrievePaymentList;
  late MockDateFormatter mockDateFormatter;
  late MockCurrencyFormatter mockCurrencyFormatter;

  setUp(() {
    mockRetrievePaymentList = MockRetrievePaymentList();
    mockDateFormatter = MockDateFormatter();
    mockCurrencyFormatter = MockCurrencyFormatter();

    sut = PaymentStore(
      retrievePaymentList: mockRetrievePaymentList,
      dateFormatter: mockDateFormatter,
      currencyFormatter: mockCurrencyFormatter,
    );
  });

  test(
    'paymentList should start as null',
    () async {
      final result = sut.paymentList;

      expect(result, isNull);

      verifyZeroInteractions(mockRetrievePaymentList);
    },
  );

  test(
    'should has the initial state from the store',
    () async {
      final result = sut.currentState;

      expect(result, PaymentPageState.init);

      verifyZeroInteractions(mockRetrievePaymentList);
    },
  );

  test(
    'should has the initial errorMessage empty from the store',
    () async {
      final result = sut.errorMessage;

      expect(result, isEmpty);

      verifyZeroInteractions(mockRetrievePaymentList);
    },
  );

  group('init', () {
    test(
      'should return an error state when the RetrievePaymentList() call fails',
      () async {
        when(() => mockRetrievePaymentList()).thenAnswer(
          (_) async => UseCaseResponseExtension.createFailure(
            const ServerFailure(),
          ),
        );

        await sut.init();

        verify(() => mockRetrievePaymentList()).called(1);

        final errorMessage = sut.errorMessage;
        final stateResultAfterCall = sut.currentState;

        expect(errorMessage, isNotEmpty);
        expect(stateResultAfterCall, PaymentPageState.error);
      },
    );

    test(
      'should return an paymentList after the call',
      () async {
        final expected = [
          Payment(
            status: PaymentStatus.open,
            value: 3100,
            dueDate: '01/09/2020',
            effectiveDate: '01/08/2020',
            details: [
              PaymentDetails(description: 'Pacote Yuca', value: 2600),
              PaymentDetails(description: 'Multa por Atraso', value: -90),
              PaymentDetails(
                  description: 'ServiÃ§o adicional kit 30 marmitas',
                  value: 410),
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
                  description: 'ServiÃ§o adicional kit 30 marmitas',
                  value: 410),
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

        when(() => mockRetrievePaymentList()).thenAnswer((_) async =>
            UseCaseResponseExtension.createSuccess<List<Payment>>(expected));

        final resultBeforeCall = sut.paymentList;
        final stateResultBeforeCall = sut.currentState;

        expect(resultBeforeCall, isNull);
        expect(stateResultBeforeCall, PaymentPageState.init);

        await sut.init();

        verify(() => mockRetrievePaymentList()).called(1);

        final resultAfterCall = sut.paymentList;
        final stateResultAfterCall = sut.currentState;

        expect(resultAfterCall, expected);
        expect(stateResultAfterCall, PaymentPageState.loaded);
      },
    );
  });
}
