import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

import '../../../../../../commons/extensions/theme/theme_context.dart';
import '../../../../domain/entities/payment.dart';
import '../../../stores/payment_store.dart';
import '../widgets/payment_card.dart';
import '../../payment_details/payment_details_page.dart';

class PaymentListLoadedState extends StatelessWidget {
  const PaymentListLoadedState(
      {required this.payments,
      required this.onTapDetails,
      required this.onTapPay,
      required this.paymentStore,
      Key? key})
      : super(key: key);

  final List<Payment> payments;
  final void Function(Payment payment) onTapPay;
  final void Function(Payment payment, VoidCallback onClose) onTapDetails;
  final PaymentStore paymentStore;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: payments.length,
      itemBuilder: (context, index) {
        final payment = payments[index];
        return OpenContainer(
          closedColor: context.backgroundColor,
          openColor: Colors.transparent,
          transitionType: ContainerTransitionType.fadeThrough,
          closedBuilder: (BuildContext _, VoidCallback openContainer) {
            return PaymentCard(
                payment: payment,
                onDetails: (payment) => onTapDetails(payment, openContainer),
                onPay: onTapPay);
          },
          openBuilder: (BuildContext _, VoidCallback __) {
            paymentStore.selectPayment = payment;
            return const PaymentDetailsPage();
          },
        );
      },
    );
  }
}
