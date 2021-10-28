import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yuca_payment/commons/base/entity.dart';
import 'package:yuca_payment/features/payment/domain/entities/payment_details.dart';

void main() {
  late PaymentDetails sut;

  setUp(() {
    sut = PaymentDetails(
      description: 'Pacote Yuca',
      value: 2600,
    );
  });
  test('should extend the Entity class', () {
    expect(sut, isA<Entity>());
  });
  test('should extend the Equatable class', () {
    expect(sut, isA<Equatable>());
  });
}
