import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yuca_payment/commons/base/model.dart';
import 'package:yuca_payment/features/payment/data/models/payment_details_model.dart';
import 'package:yuca_payment/features/payment/data/models/payment_model.dart';
import 'package:yuca_payment/features/payment/domain/entities/payment.dart';
import 'package:yuca_payment/features/payment/domain/entities/payment_details.dart';
import 'package:yuca_payment/features/payment/shared/enums/payment_status.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  late PaymentModel sut;

  setUp(() {
    sut = PaymentModel(
        status: 'open',
        value: 3100,
        dueDate: '01/09/2020',
        effectiveDate: '01/08/2020',
        details: [
          PaymentDetailsModel(descripton: 'Pacote Yuca', value: 2600),
          PaymentDetailsModel(descripton: 'Multa por Atraso', value: -90),
          PaymentDetailsModel(
              descripton: 'ServiÃ§o adicional kit 30 marmitas', value: 410),
        ]);
  });

  test('should implement the Model class', () {
    expect(sut, isA<Model>());
  });
  test('should extends the Equatable class', () {
    expect(sut, isA<Equatable>());
  });
  test('should extends the Entity class', () {
    expect(sut, isA<Payment>());
  });

  group('fromEntity', () {
    test('should return a PaymentModel from a given Payment', () {
      final payment = Payment(
          status: PaymentStatus.open,
          value: 3100,
          dueDate: '01/09/2020',
          effectiveDate: '01/08/2020',
          details: [
            PaymentDetails(description: 'Pacote Yuca', value: 2600),
            PaymentDetails(description: 'Multa por Atraso', value: -90),
            PaymentDetails(
                description: 'ServiÃ§o adicional kit 30 marmitas', value: 410),
          ]);

      final result = PaymentModel.fromEntity(payment);

      expect(sut, result);
    });
  });

  group('fromJson', () {
    test('should return a PaymentModel from a given JSON', () {
      final jsonData = json.decode(
        fixtureFeature('payment', 'payment.json'),
      );

      final result = PaymentModel.fromJson(jsonData);

      expect(result, sut);
    });
  });

  group('toJson', () {
    test('should return a JSON from a given PaymentModel', () {
      final expected = {
        'status': 'open',
        'value': 3100,
        'dueDate': '01/09/2020',
        'effectiveDate': '01/08/2020',
        'details': [
          {'descripton': 'Pacote Yuca', 'value': 2600},
          {'descripton': 'Multa por Atraso', 'value': -90},
          {'descripton': 'ServiÃ§o adicional kit 30 marmitas', 'value': 410}
        ]
      };

      final result = sut.toJson();

      expect(result, expected);
    });
  });
}
