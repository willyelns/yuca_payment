import 'package:flutter/foundation.dart';

import './analytics_parameters.dart';

class OpenPaymentParameters extends AnalyticsParameters {
  final String paymentId;
  final String paymentValue;

  OpenPaymentParameters({
    required this.paymentId,
    required this.paymentValue,
  }) : super();

  @override
  @mustCallSuper
  Map<String, dynamic> toMap() {
    final superMap = super.toMap();
    return <String, dynamic>{
      'payment_id': paymentId,
      'payment_value': paymentValue,
      ...superMap,
    };
  }
}
