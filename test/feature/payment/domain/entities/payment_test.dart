import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yuca_payment/commons/base/entity.dart';
import 'package:yuca_payment/features/payment/domain/entities/payment.dart';
import 'package:yuca_payment/features/payment/domain/entities/payment_details.dart';
import 'package:yuca_payment/features/payment/shared/enums/payment_status.dart';

void main() {
  late Payment sut;

  setUp(() {
    sut = Payment(
        status: PaymentStatus.closed,
        value: 2600,
        dueDate: '01/08/2020',
        effectiveDate: '01/07/2020',
        details: [
          PaymentDetails(description: 'Pacote Yuca', value: 2600),
        ]);
  });
  test('should extend the Entity class', () {
    expect(sut, isA<Entity>());
  });
  test('should extend the Equatable class', () {
    expect(sut, isA<Equatable>());
  });
}
