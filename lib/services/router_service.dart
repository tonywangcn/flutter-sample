import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import '../app/app.dart';
import '../common/route.dart';
import '../screens/accounts/log_in/log_in_route.dart';
import '../screens/accounts/sign_up/sign_up_route.dart';
import '../screens/settings/settings_route.dart';
import '../screens/splash/splash_route.dart';
import '../screens/todo/edit_task/edit_task_route.dart';
import '../screens/todo/todo/todo_route.dart';

class RouterService {
  static RouterService get instance => RouterService();
  factory RouterService() => _singleton;
  static final RouterService _singleton = RouterService._init();

  static final List<ARoute> routes = [
    SplashRoute(),
    SignUpRoute(),
    LogInRoute(),
    TodoRoute(),
    EditTaskRoute(),
    SettingsRoute(),
  ];

  final Router _router = Router();

  RouterService._init() {
    for (var route in routes) {
      _router.define(
        route.path,
        handler: Handler(handlerFunc: route.handlerFunc),
        transitionType: route.transition,
      );
    }
  }

  Route<dynamic> generator(RouteSettings routeSettings) => _router.generator(routeSettings);

  void pop(BuildContext context) => _router.pop(context);

  Future<dynamic> navigateTo(
    String path, {
    bool replace,
    bool clearStack,
    TransitionType transition,
    Duration transitionDuration,
    RouteTransitionsBuilder transitionBuilder,
    BuildContext context,
  }) async {
    final match = _router.match(path);
    if (match != null) {
      final route = routes.firstWhere((r) => r.path == match.route.route);
      final hasPermission = await route.hasPermission(match.parameters);
      if (hasPermission) {
        if (context != null) {
          return _router.navigateTo(
            context,
            path,
            replace: replace ?? route.replace,
            clearStack: clearStack ?? route.clearStack,
            transition: transition ?? route.transition,
            transitionDuration: transitionDuration ?? route.transitionDuration,
            transitionBuilder: transitionBuilder ?? route.transitionBuilder,
          );
        } else if (clearStack ?? route.clearStack) {
          return App.navigatorKey.currentState.pushNamedAndRemoveUntil(path, (check) => false);
        } else if (replace ?? route.replace) {
          return App.navigatorKey.currentState.pushReplacementNamed(path);
        } else {
          return App.navigatorKey.currentState.pushNamed(path);
        }
      }
    }
  }
}
