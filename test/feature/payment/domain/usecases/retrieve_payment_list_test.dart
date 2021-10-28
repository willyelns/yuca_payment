import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:yuca_payment/commons/errors/failures/server_failure.dart';
import 'package:yuca_payment/commons/types/use_case_response.dart';
import 'package:yuca_payment/features/payment/domain/entities/payment.dart';
import 'package:yuca_payment/features/payment/domain/entities/payment_details.dart';
import 'package:yuca_payment/features/payment/domain/repositories/payment_repository.dart';
import 'package:yuca_payment/features/payment/domain/usecases/retrieve_payment_list.dart';
import 'package:yuca_payment/features/payment/shared/enums/payment_status.dart';

class MockPaymentRepository extends Mock implements PaymentRepository {}

void main() {
  late RetrievePaymentList sut;
  late MockPaymentRepository mockPaymentRepository;

  setUp(() {
    mockPaymentRepository = MockPaymentRepository();
    sut = RetrievePaymentListImpl(mockPaymentRepository);
  });

  final payment = [
    Payment(
        status: PaymentStatus.closed,
        value: 2600,
        dueDate: '01/08/2020',
        effectiveDate: '01/07/2020',
        details: [
          PaymentDetails(description: 'Pacote Yuca', value: 2600),
        ])
  ];

  test('should get the payment from the repository', () async {
    final expected =
        await UseCaseResponseExtension.createSuccess<List<Payment>>(
      payment,
    );

    when(() => mockPaymentRepository.retrievePaymentList())
        .thenAnswer((_) async => expected);

    final result = await sut();

    expect(result, expected);

    verify(() => mockPaymentRepository.retrievePaymentList());

    verifyNoMoreInteractions(mockPaymentRepository);
  });

  test('should get a failure when the repository fails to get the payment',
      () async {
    const serverFailure = ServerFailure();

    final expected =
        await UseCaseResponseExtension.createFailure<List<Payment>>(
      serverFailure,
    );

    when(() => mockPaymentRepository.retrievePaymentList())
        .thenAnswer((_) async => expected);

    final result = await sut();

    expect(result, expected);

    verify(() => mockPaymentRepository.retrievePaymentList());

    verifyNoMoreInteractions(mockPaymentRepository);
  });
}
