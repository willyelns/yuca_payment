import 'package:flutter/material.dart';

import '../../../../commons/extensions/theme/theme_context.dart';

class PaymentDueDate extends StatelessWidget {
  const PaymentDueDate({required this.date, Key? key}) : super(key: key);

  final String date;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Vencimento em $date',
      style: context.bodyText1,
      textAlign: TextAlign.center,
    );
  }
}
