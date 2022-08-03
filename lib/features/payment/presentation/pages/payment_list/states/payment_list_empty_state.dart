import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../commons/extensions/theme/theme_context.dart';

class PaymentListEmptyState extends StatelessWidget {
  const PaymentListEmptyState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'lib/assets/icons/empty.svg',
          width: context.width * 0.4,
        ),
        const SizedBox(height: 16),
        Text(
          'Nenhum pagamento encontrado no momento.',
          style: context.headline2!.copyWith(
            height: 1.5,
            fontWeight: FontWeight.w300,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
