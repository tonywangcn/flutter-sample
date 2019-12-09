import 'package:com_cingulo_sample/common/route.dart';
import 'package:com_cingulo_sample/screens/splash/splash_screen.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class SplashRoute extends ARoute {
  static String _path = '/splash';
  static String buildPath() => _path;

  @override
  String get path => _path;

  @override
  final bool clearStack = true;

  @override
  final TransitionType transition = TransitionType.fadeIn;

  @override
  Widget handlerFunc(BuildContext context, Map<String, dynamic> params) => SplashScreen();
}
