import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yuca_payment/commons/base/model.dart';
import 'package:yuca_payment/features/payment/data/models/payment_details_model.dart';
import 'package:yuca_payment/features/payment/domain/entities/payment_details.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  late PaymentDetailsModel sut;

  setUp(() {
    sut = PaymentDetailsModel(descripton: 'Pacote Yuca', value: 2600);
  });

  test('should implement the Model class', () {
    expect(sut, isA<Model>());
  });
  test('should extends the Equatable class', () {
    expect(sut, isA<Equatable>());
  });
  test('should extends the Entity class', () {
    expect(sut, isA<PaymentDetails>());
  });

  group('fromEntity', () {
    test('should return a PaymentDetailsModel from a given PaymentDetails', () {
      final paymentDetails =
          PaymentDetails(description: 'Pacote Yuca', value: 2600);

      final result = PaymentDetailsModel.fromEntity(paymentDetails);

      expect(sut, result);
    });
  });

  group('fromJson', () {
    test('should return a PaymentDetailsModel from a given JSON', () {
      final jsonData = json.decode(
        fixtureFeature('payment', 'payment_details.json'),
      );

      final result = PaymentDetailsModel.fromJson(jsonData);

      expect(result, sut);
    });
  });

  group('toJson', () {
    test('should return a JSON from a given PaymentDetailsModel', () {
      final expected = {'descripton': 'Pacote Yuca', 'value': 2600};

      final result = sut.toJson();

      expect(result, expected);
    });
  });
}
