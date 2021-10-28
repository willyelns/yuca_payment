import 'package:flutter/material.dart';
import '../../../../commons/extensions/theme/theme_context.dart';

class PaymentValue extends StatelessWidget {
  const PaymentValue({required this.color, required this.value, Key? key})
      : super(key: key);

  final Color color;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      style: context.headline1!.copyWith(color: color),
      textAlign: TextAlign.center,
    );
  }
}
