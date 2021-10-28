import 'package:yuca_payment/commons/base/entity.dart';
import 'package:yuca_payment/features/payment/domain/entities/payment_details.dart';
import 'package:yuca_payment/features/payment/shared/enums/payment_status.dart';

class Payment extends Entity<Payment> {
  Payment({
    required this.status,
    required this.value,
    required this.dueDate,
    required this.effectiveDate,
    required this.details,
  });

  final PaymentStatus status;
  final int value;
  final String dueDate;
  final String effectiveDate;
  final List<PaymentDetails> details;

  @override
  Payment copyWith({
    PaymentStatus? status,
    int? value,
    String? dueDate,
    String? effectiveDate,
    List<PaymentDetails>? details,
  }) {
    return Payment(
      status: status ?? this.status,
      value: value ?? this.value,
      dueDate: dueDate ?? this.dueDate,
      effectiveDate: effectiveDate ?? this.effectiveDate,
      details: details ?? this.details,
    );
  }

  @override
  List<Object?> get props => [
        status,
        value,
        dueDate,
        effectiveDate,
        details,
      ];
}
