import 'package:flutter/material.dart';

import '../../../../commons/errors/exceptions/out_of_bounds_exception.dart';
import '../../../../commons/theme/theme.dart';

enum PaymentStatus {
  open,
  closed,
  paid,
}

extension PaymentStatusExtension on PaymentStatus {
  static PaymentStatus fromString(String status) {
    switch (status.toLowerCase()) {
      case 'open':
        return PaymentStatus.open;
      case 'closed':
        return PaymentStatus.closed;
      case 'paid':
        return PaymentStatus.paid;
      default:
        throw OutOfBoundsException(
          message: 'Unknown payment status type: $status',
        );
    }
  }

  String get value => toString().split('.').last;

  String get raw {
    switch (this) {
      case PaymentStatus.closed:
        return 'closed';
      case PaymentStatus.open:
        return 'open';
      case PaymentStatus.paid:
        return 'paid';
    }
  }

  Color getStatusColor({
    bool isHeader = false,
    bool isFont = false,
  }) {
    switch (this) {
      case PaymentStatus.open:
        if (isHeader) {
          return _getHeaderColor;
        }
        if (isFont) {
          return _getFontColor;
        }
        return kDefaultColorScheme.open;
      case PaymentStatus.closed:
        if (isHeader) {
          return _getHeaderColor;
        }
        if (isFont) {
          return _getFontColor;
        }
        return kDefaultColorScheme.closed;
      case PaymentStatus.paid:
        if (isHeader) {
          return _getHeaderColor;
        }
        if (isFont) {
          return _getFontColor;
        }
        return kDefaultColorScheme.paid;
    }
  }

  Color get _getHeaderColor {
    switch (this) {
      case PaymentStatus.open:
        return kDefaultColorScheme.surface;
      case PaymentStatus.closed:
        return kDefaultColorScheme.closed;
      case PaymentStatus.paid:
        return kDefaultColorScheme.paid;
    }
  }

  Color get _getFontColor {
    return this == PaymentStatus.open
        ? kDefaultColorScheme.open
        : kDefaultColorScheme.surface;
  }

  String get headerTitle {
    switch (this) {
      case PaymentStatus.open:
        return 'Mensalidade Aberta';
      case PaymentStatus.closed:
        return 'Mensalidade Fechada';
      case PaymentStatus.paid:
        return 'Mensalidade Paga';
    }
  }
}
