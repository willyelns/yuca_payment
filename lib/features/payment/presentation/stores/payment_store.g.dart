// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PaymentStore on _PaymentStoreBase, Store {
  Computed<PaymentPageState>? _$currentStateComputed;

  @override
  PaymentPageState get currentState => (_$currentStateComputed ??=
          Computed<PaymentPageState>(() => super.currentState,
              name: '_PaymentStoreBase.currentState'))
      .value;
  Computed<String>? _$errorMessageComputed;

  @override
  String get errorMessage =>
      (_$errorMessageComputed ??= Computed<String>(() => super.errorMessage,
              name: '_PaymentStoreBase.errorMessage'))
          .value;
  Computed<Payment?>? _$selectedPaymentComputed;

  @override
  Payment? get selectedPayment => (_$selectedPaymentComputed ??=
          Computed<Payment?>(() => super.selectedPayment,
              name: '_PaymentStoreBase.selectedPayment'))
      .value;

  late final _$_stateAtom =
      Atom(name: '_PaymentStoreBase._state', context: context);

  @override
  PaymentPageState get _state {
    _$_stateAtom.reportRead();
    return super._state;
  }

  @override
  set _state(PaymentPageState value) {
    _$_stateAtom.reportWrite(value, super._state, () {
      super._state = value;
    });
  }

  late final _$paymentListAtom =
      Atom(name: '_PaymentStoreBase.paymentList', context: context);

  @override
  List<Payment>? get paymentList {
    _$paymentListAtom.reportRead();
    return super.paymentList;
  }

  @override
  set paymentList(List<Payment>? value) {
    _$paymentListAtom.reportWrite(value, super.paymentList, () {
      super.paymentList = value;
    });
  }

  late final _$_selectedPaymentAtom =
      Atom(name: '_PaymentStoreBase._selectedPayment', context: context);

  @override
  Payment? get _selectedPayment {
    _$_selectedPaymentAtom.reportRead();
    return super._selectedPayment;
  }

  @override
  set _selectedPayment(Payment? value) {
    _$_selectedPaymentAtom.reportWrite(value, super._selectedPayment, () {
      super._selectedPayment = value;
    });
  }

  late final _$initAsyncAction =
      AsyncAction('_PaymentStoreBase.init', context: context);

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  @override
  String toString() {
    return '''
paymentList: ${paymentList},
currentState: ${currentState},
errorMessage: ${errorMessage},
selectedPayment: ${selectedPayment}
    ''';
  }
}
