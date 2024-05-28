import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigator = GlobalKey<NavigatorState>();

Future<dynamic> push(String named, {String? arg,}) {
  return Navigator.of(navigator.currentContext!)
      .pushNamed(named, arguments: arg);
}

Future<dynamic> replacement(String named, BuildContext context, {dynamic arg}) {
  return Navigator.of(navigator.currentContext!)
      .pushReplacementNamed(named, arguments: arg);
}

Future<dynamic> pushAndRemoveUntil(String named, {dynamic arg}) {
  return Navigator.of(navigator.currentContext!)
      .pushNamedAndRemoveUntil(named, (route) => false, arguments: arg);
}
