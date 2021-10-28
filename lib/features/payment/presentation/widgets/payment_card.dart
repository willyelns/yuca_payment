import 'package:flutter/material.dart';
import 'package:yuca_payment/features/payment/presentation/stores/payment_store.dart';
import 'package:yuca_payment/features/payment/presentation/widgets/custom_divider.dart';
import 'package:yuca_payment/features/payment/presentation/widgets/payment_card_details_button.dart';
import 'package:yuca_payment/features/payment/presentation/widgets/payment_card_pay_button.dart';
import 'package:yuca_payment/features/payment/presentation/widgets/payment_due_date.dart';
import 'package:yuca_payment/features/payment/presentation/widgets/payment_effective_date.dart';
import 'package:yuca_payment/features/payment/presentation/widgets/payment_header.dart';
import 'package:yuca_payment/features/payment/presentation/widgets/payment_value.dart';
import 'package:yuca_payment/features/payment/shared/enums/payment_status.dart';
import 'package:yuca_payment/injection_container.dart';

import '../../domain/entities/payment.dart';
import '../../../../commons/extensions/theme/theme_context.dart';

class PaymentCard extends StatelessWidget {
  const PaymentCard({
    required this.payment,
    required this.onDetails,
    required this.onPay,
    Key? key,
  }) : super(key: key);

  final Payment payment;

  final void Function(Payment payment) onDetails;
  final void Function(Payment payment) onPay;

  @override
  Widget build(BuildContext context) {
    final paymentStore = serviceLocator<PaymentStore>();

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: context.surfaceColor,
        boxShadow: [
          BoxShadow(
            color: context.baseBlackColor.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      width: 300,
      height: 330,
      child: Column(
        children: [
          PaymentHeader(
            title: paymentStore.getHeaderTitle(payment),
            icon: paymentStore.getHeaderIcon(payment),
            color: paymentStore.getFontColor(payment),
            backgroundColor: paymentStore.getHeaderColor(payment),
          ),
          const CustomDivider(),
          const SizedBox(height: 30),
          PaymentEffectiveDate(
              date: paymentStore.formattedEffectiveDate(payment.effectiveDate)),
          const SizedBox(height: 10),
          PaymentDueDate(date: paymentStore.formattedDueDate(payment.dueDate)),
          const SizedBox(height: 10),
          PaymentValue(
            color: paymentStore.getPrimaryColor(payment),
            value: paymentStore.getRealValueFormatter(payment.value),
          ),
          const SizedBox(height: 30),
          const CustomDivider(),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PaymentCardDetailsButton(
                onPressed: () => onDetails(payment),
                primaryColor: paymentStore.getPrimaryColor(payment),
              ),
              if (payment.status == PaymentStatus.closed) ...[
                const SizedBox(width: 10),
                PaymentCardPayButton(
                  onPressed: () => onPay(payment),
                  primaryColor: paymentStore.getPrimaryColor(payment),
                )
              ]
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
