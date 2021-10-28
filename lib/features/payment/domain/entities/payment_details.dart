import 'package:yuca_payment/commons/base/entity.dart';

class PaymentDetails extends Entity<PaymentDetails> {
  PaymentDetails({
    required this.description,
    required this.value,
  });

  final String description;
  final int value;

  @override
  PaymentDetails copyWith({
    String? description,
    int? value,
  }) {
    return PaymentDetails(
      description: description ?? this.description,
      value: value ?? this.value,
    );
  }

  @override
  List<Object?> get props => [description, value];
}
