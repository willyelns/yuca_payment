import 'package:flutter/material.dart';
import 'package:yuca_payment/features/payment/presentation/pages/payment_details_page.dart';
import 'package:yuca_payment/features/payment/presentation/pages/payment_list_page.dart';

final routes = <String, WidgetBuilder>{
  '/': (context) => const PaymentListPage(),
  '/details': (context) => const PaymentDetailsPage(),
};
