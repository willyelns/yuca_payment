import 'package:flutter/material.dart';
import 'package:yuca_payment/features/payment/domain/entities/payment.dart';
import 'package:yuca_payment/features/payment/domain/entities/payment_details.dart';
import 'package:yuca_payment/features/payment/presentation/stores/payment_store.dart';
import 'package:yuca_payment/features/payment/presentation/widgets/custom_app_bar.dart';
import 'package:yuca_payment/features/payment/presentation/widgets/custom_divider.dart';
import 'package:yuca_payment/features/payment/presentation/widgets/payment_due_date.dart';
import 'package:yuca_payment/features/payment/presentation/widgets/payment_effective_date.dart';
import 'package:yuca_payment/features/payment/presentation/widgets/payment_header.dart';
import 'package:yuca_payment/features/payment/presentation/widgets/payment_value.dart';
import '../../../../commons/extensions/theme/theme_context.dart';
import '../../../../injection_container.dart';

class PaymentDetailsPage extends StatefulWidget {
  const PaymentDetailsPage({Key? key}) : super(key: key);

  @override
  State<PaymentDetailsPage> createState() => _PaymentDetailsPageState();
}

class _PaymentDetailsPageState extends State<PaymentDetailsPage> {
  final paymentStore = serviceLocator<PaymentStore>();

  late final Payment payment;

  @override
  void initState() {
    super.initState();
    payment = paymentStore.selectedPayment!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(context.width, 80),
        child: const CustomAppBar(title: 'Mensalidades', isDetails: true),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            PaymentHeader(
              backgroundColor: paymentStore.getPrimaryColor(payment),
              icon: paymentStore.getHeaderIcon(payment),
              title: paymentStore.getHeaderTitle(payment),
              isCard: false,
            ),
            const SizedBox(height: 32),
            PaymentEffectiveDate(
              date: paymentStore.formattedEffectiveDate(payment.effectiveDate),
            ),
            const SizedBox(height: 8),
            PaymentDueDate(
              date: paymentStore.formattedDueDate(payment.dueDate),
            ),
            const SizedBox(height: 22),
            PaymentValue(
              color: paymentStore.getPrimaryColor(payment),
              value: paymentStore.getRealValueFormatter(payment.value),
            ),
            const SizedBox(height: 32),
            const CustomDivider(),
            const SizedBox(height: 32),
            for (int i = 0; i < payment.details.length; i++)
              _buildPaymentDetailsItem(
                payment.details[i],
                payment.details.last == payment.details[i],
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentDetailsItem(PaymentDetails paymentDetails, bool isLast) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          ListTile(
            title: Text(paymentDetails.description, style: context.bodyText1),
            trailing: Text(
              paymentStore.getRealValueFormatter(paymentDetails.value),
              style: context.bodyText1,
            ),
          ),
          if (!isLast) const CustomDivider(),
        ],
      ),
    );
  }
}
