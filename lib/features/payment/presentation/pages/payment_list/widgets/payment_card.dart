import 'package:flutter/material.dart';

import '../../../../../../commons/extensions/theme/theme_context.dart';
import '../../../../../../injection_container.dart';
import '../../../../domain/entities/payment.dart';
import '../../../../shared/enums/payment_status.dart';
import '../../../stores/payment_store.dart';
import '../../../widgets/custom_divider.dart';
import '../../../widgets/payment_due_date.dart';
import '../../../widgets/payment_effective_date.dart';
import '../../../widgets/payment_header.dart';
import '../../../widgets/payment_value.dart';
import '../../payment_details/widgets/payment_card_details_button.dart';
import 'payment_card_pay_button.dart';

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
