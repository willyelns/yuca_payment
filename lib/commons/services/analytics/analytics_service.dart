abstract class AnalyticsService {
  /// Initial configuration to run the analytics property
  Future<void> initAnalytics();

  /// Binds a user to the [events] using an ID
  /// The [userIdenfier] type should be limited by the class that implements this method.
  Future<void> registerUserInformation<T>(T userIdentifier);

  /// Logs the tap on the payment card to see details
  /// using [parameters] to added extra data
  Future<void> logOpenPaymentDetailsEvent<T>(T parameters);
}
