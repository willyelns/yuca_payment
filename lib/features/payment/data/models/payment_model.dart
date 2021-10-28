import 'package:yuca_payment/commons/base/model.dart';
import 'package:yuca_payment/commons/types/json_data.dart';
import 'package:yuca_payment/features/payment/data/models/payment_details_model.dart';
import 'package:yuca_payment/features/payment/domain/entities/payment.dart';
import 'package:yuca_payment/features/payment/shared/enums/payment_status.dart';

class PaymentModel extends Payment implements Model {
  PaymentModel({
    required String status,
    required int value,
    required String dueDate,
    required String effectiveDate,
    required List<PaymentDetailsModel> details,
  }) : super(
            details: details,
            effectiveDate: effectiveDate,
            dueDate: dueDate,
            value: value,
            status: PaymentStatusExtension.fromString(status));

  factory PaymentModel.fromJson(JsonData json) {
    return PaymentModel(
      status: json['status'],
      value: json['value'],
      dueDate: json['dueDate'],
      effectiveDate: json['effectiveDate'],
      details: (json['details'] as List<dynamic>)
          .map((paymentDetailsJson) =>
              PaymentDetailsModel.fromJson(paymentDetailsJson as JsonData))
          .toList(),
    );
  }

  factory PaymentModel.fromEntity(Payment payment) {
    return PaymentModel(
      status: payment.status.value,
      value: payment.value,
      dueDate: payment.dueDate,
      effectiveDate: payment.effectiveDate,
      details: payment.details
          .map((paymentDetails) =>
              PaymentDetailsModel.fromEntity(paymentDetails))
          .toList(),
    );
  }

  @override
  JsonData toJson() {
    return {
      'status': status.value,
      'value': value,
      'dueDate': dueDate,
      'effectiveDate': effectiveDate,
      'details': details
          .map((paymentDetails) =>
              PaymentDetailsModel.fromEntity(paymentDetails).toJson())
          .toList(),
    };
  }
}
