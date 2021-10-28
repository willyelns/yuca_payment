import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../commons/extensions/theme/theme_context.dart';

class PaymentHeader extends StatelessWidget {
  const PaymentHeader({
    required this.backgroundColor,
    required this.icon,
    required this.title,
    this.color = Colors.white,
    this.isCard = true,
    Key? key,
  }) : super(key: key);

  final Color backgroundColor;
  final Color color;
  final String icon;
  final String title;
  final bool isCard;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 64,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius:
            isCard ? BorderRadius.circular(4) : BorderRadius.circular(0),
        color: backgroundColor,
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        SvgPicture.asset(
          'lib/assets/icons/$icon.svg',
          color: color,
        ),
        const SizedBox(width: 16),
        Text(
          title,
          textAlign: TextAlign.center,
          style: isCard
              ? context.headline3!.copyWith(color: color)
              : context.headline2!.copyWith(color: color),
        ),
      ]),
    );
  }
}
