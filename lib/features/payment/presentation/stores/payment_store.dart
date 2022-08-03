import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../commons/formatters/currency_formatter.dart';
import '../../../../commons/formatters/date_formatter.dart';
import '../../../../commons/types/use_case_response.dart';
import '../../domain/entities/payment.dart';
import '../../domain/usecases/retrieve_payment_list.dart';
import '../../shared/enums/payment_status.dart';

part 'payment_store.g.dart';

enum PaymentPageState { init, loading, loaded, error, empty }

class PaymentStore = _PaymentStoreBase with _$PaymentStore;

abstract class _PaymentStoreBase with Store {
  _PaymentStoreBase({
    required RetrievePaymentList retrievePaymentList,
    required DateFormatter dateFormatter,
    required CurrencyFormatter currencyFormatter,
  })  : _retrievePaymentList = retrievePaymentList,
        _dateFormatter = dateFormatter,
        _currencyFormatter = currencyFormatter;

  final RetrievePaymentList _retrievePaymentList;
  final DateFormatter _dateFormatter;
  final CurrencyFormatter _currencyFormatter;

  @observable
  PaymentPageState _state = PaymentPageState.init;

  @observable
  List<Payment>? paymentList;

  @observable
  Payment? _selectedPayment;

  @computed
  PaymentPageState get currentState => _state;

  @computed
  String get errorMessage => _state == PaymentPageState.error
      ? 'Ops! Algum erro aconteceu, tente novamente mais tarde.'
      : '';

  String getDuoDate(Payment payment) =>
      _dateFormatter.fullMonthNameAndYear(payment.dueDate);

  @computed
  Payment? get selectedPayment => _selectedPayment;

  set selectPayment(Payment payment) {
    _selectedPayment = payment;
  }

  @action
  Future<void> init() async {
    _state = PaymentPageState.loading;

    final paymentListUseCaseResponse = _retrievePaymentList();

    await paymentListUseCaseResponse.open(
      successCallback: (paymentList) {
        this.paymentList = paymentList;
        if (this.paymentList == null || this.paymentList!.isEmpty) {
          _state = PaymentPageState.empty;
          return;
        }
        _state = PaymentPageState.loaded;
        // _state = PaymentPageState.error;
      },
      failureCallback: (failure) {
        _state = PaymentPageState.error;
      },
    );
  }

  String getHeaderIcon(Payment payment) {
    switch (payment.status) {
      case PaymentStatus.open:
        return 'open';
      case PaymentStatus.closed:
        return 'closed';
      case PaymentStatus.paid:
        return 'paid';
    }
  }

  String getHeaderTitle(Payment payment) {
    final paymentStatus = payment.status;
    return paymentStatus.headerTitle;
  }

  Color getHeaderColor(Payment payment) {
    final paymentStatus = payment.status;
    return paymentStatus.getStatusColor(isHeader: true);
  }

  Color getFontColor(Payment payment) {
    final paymentStatus = payment.status;
    return paymentStatus.getStatusColor(isFont: true);
  }

  Color getPrimaryColor(Payment payment) {
    final paymentStatus = payment.status;
    return paymentStatus.getStatusColor();
  }

  String getRealValueFormatter(int value) {
    return _currencyFormatter.parseIntToReal(value);
  }

  String formattedDueDate(String date) {
    return _dateFormatter.shortDayAndMonth(date);
  }

  String formattedEffectiveDate(String date) {
    return _dateFormatter.fullMonthNameAndYear(date);
  }
}
