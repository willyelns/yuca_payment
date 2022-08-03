import 'package:flutter/material.dart';

import '../../../../../../commons/extensions/theme/theme_context.dart';
import '../../../../domain/entities/payment_details.dart';

class PaymentDetailsItem extends StatelessWidget {
  const PaymentDetailsItem({
    required this.paymentDetails,
    required this.value,
    Key? key,
  }) : super(key: key);

  final PaymentDetails paymentDetails;
  final String value;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 30),
      title: Text(paymentDetails.description, style: context.bodyText1),
      trailing: Text(
        value,
        style: context.bodyText1,
      ),
    );
  }
}
