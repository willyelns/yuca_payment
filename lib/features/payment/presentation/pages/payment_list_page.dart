import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:yuca_payment/features/payment/domain/entities/payment.dart';
import 'package:yuca_payment/features/payment/presentation/pages/payment_details_page.dart';
import 'package:yuca_payment/features/payment/presentation/stores/payment_store.dart';
import 'package:yuca_payment/features/payment/presentation/widgets/custom_app_bar.dart';
import 'package:yuca_payment/features/payment/presentation/widgets/payment_card.dart';
import 'package:yuca_payment/injection_container.dart';

import '../../../../commons/extensions/theme/theme_context.dart';

class PaymentListPage extends StatefulWidget {
  const PaymentListPage({Key? key}) : super(key: key);

  @override
  State<PaymentListPage> createState() => _PaymentListPageState();
}

class _PaymentListPageState extends State<PaymentListPage> {
  final paymentStore = serviceLocator<PaymentStore>();

  late ScrollController _scrollController;

  @override
  void initState() {
    paymentStore.init();
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size(context.width, 80.0),
        child: const CustomAppBar(
          title: 'Pagamentos',
        ),
      ),
      body: Container(
        width: context.width,
        height: context.height,
        padding: const EdgeInsets.all(16),
        child: Observer(builder: (context) {
          final currentState = paymentStore.currentState;

          if (currentState == PaymentPageState.loading) {
            return ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return Shimmer.fromColors(
                  baseColor: Colors.grey[400]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    width: 300,
                    height: 330,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.grey[300]!,
                    ),
                  ),
                );
              },
            );
          }

          if (currentState == PaymentPageState.error) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'lib/assets/icons/error.svg',
                  width: context.width * 0.4,
                ),
                const SizedBox(height: 16),
                Text(
                  'Erro ao encontrar os pagamentos.',
                  style: context.headline2!.copyWith(
                    height: 1.5,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            );
          }

          if (currentState == PaymentPageState.empty) {
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

          if (currentState == PaymentPageState.loaded) {
            final payments = paymentStore.paymentList!;
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
                      onDetails: (payment) =>
                          _goToDetails(payment, openContainer),
                      onPay: _goToPay,
                    );
                  },
                  openBuilder: (BuildContext _, VoidCallback __) {
                    paymentStore.selectPayment = payment;
                    return const PaymentDetailsPage();
                  },
                );
              },
            );
          }

          return const Center(
            child: Text('Payment List'),
          );
        }),
      ),
    );
  }

  void _goToDetails(Payment payment, VoidCallback openContainer) {
    paymentStore.selectPayment = payment;
    openContainer();
  }

  void _goToPay(Payment payment) {
    const snackBar = SnackBar(
        content:
            Text('Ops, não foi possível gerar o pagamento no momento. :('));
    context.showSnackBar(snackBar);
  }
}
