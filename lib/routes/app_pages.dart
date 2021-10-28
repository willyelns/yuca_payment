import 'package:flutter/material.dart';
import 'routes.dart';

enum AppPages {
  paymentDetails,
}

extension AppPagesExtension on AppPages {
  String get raw {
    switch (this) {
      case AppPages.paymentDetails:
        return '/details';
    }
  }
}

typedef RoutePredicate = bool Function(Route<dynamic>);

extension ContextNavigation on BuildContext {
  Future<T?> pushReplacementRoute<T extends Object?, TO extends Object?>(
    AppPages page, {
    TO? result,
    Object? arguments,
  }) {
    final route = routes[page.raw]!;
    return Navigator.of(this).pushReplacement<T, TO>(MaterialPageRoute(
      builder: route,
    ));
  }

  Future<T?> pushReplacement<T extends Object?, TO extends Object?>(
    AppPages page, {
    TO? result,
    Object? arguments,
  }) {
    return Navigator.of(this).pushReplacementNamed<T, TO>(
      page.raw,
      result: result,
      arguments: arguments,
    );
  }

  Future<T?> popAndPush<T extends Object?, TO extends Object?>(
    AppPages page, {
    TO? result,
    Object? arguments,
  }) {
    return Navigator.of(this).popAndPushNamed<T, TO>(
      page.raw,
      result: result,
      arguments: arguments,
    );
  }

  Future<T?> pushAndRemoveUntil<T extends Object?>(
    AppPages page, {
    RoutePredicate? predicate,
    Object? arguments,
  }) {
    final routePredicate = predicate ?? (route) => false;
    return Navigator.of(this).pushNamedAndRemoveUntil(
      page.raw,
      routePredicate,
      arguments: arguments,
    );
  }

  Future<T?> push<T extends Object?>(AppPages page, {Object? arguments}) {
    return Navigator.of(this).pushNamed<T>(page.raw, arguments: arguments);
  }

  void pop<T extends Object?>([T? result]) {
    return Navigator.of(this).pop<T>(result);
  }

  bool canPop() {
    return Navigator.of(this).canPop();
  }
}
