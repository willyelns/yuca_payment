import 'package:equatable/equatable.dart';

class OutOfBoundsException extends Equatable implements Exception {
  const OutOfBoundsException({this.message});

  final String? message;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [message];
}
