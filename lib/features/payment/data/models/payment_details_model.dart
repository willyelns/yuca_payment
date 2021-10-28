import 'package:yuca_payment/commons/base/model.dart';
import 'package:yuca_payment/commons/types/json_data.dart';
import 'package:yuca_payment/features/payment/domain/entities/payment_details.dart';

import '../../../../commons/types/json_data.dart';

class PaymentDetailsModel extends PaymentDetails implements Model {
  PaymentDetailsModel({
    required String descripton,
    required int value,
  }) : super(description: descripton, value: value);

  factory PaymentDetailsModel.fromEntity(PaymentDetails paymentDetails) {
    return PaymentDetailsModel(
      descripton: paymentDetails.description,
      value: paymentDetails.value,
    );
  }

  factory PaymentDetailsModel.fromJson(JsonData json) {
    return PaymentDetailsModel(
      descripton: json['descripton'],
      value: json['value'],
    );
  }

  @override
  JsonData toJson() {
    return {
      'descripton': description,
      'value': value,
    };
  }
}
