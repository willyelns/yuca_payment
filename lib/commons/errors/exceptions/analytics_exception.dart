import 'package:equatable/equatable.dart';

class AnalyticsException extends Equatable implements Exception {
  const AnalyticsException({this.message});

  final String? message;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        message,
      ];
}
