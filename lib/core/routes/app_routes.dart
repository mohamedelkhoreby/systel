import 'package:flutter/material.dart';
import 'package:systel/core/routes/routes.dart';
import 'package:systel/view/home/view/home_page.dart';

import '../../view/auth/login/view/login_page.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case NamedRoutes.main:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case NamedRoutes.login:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('No Route Found'),
        ),
        body: const Center(
          child: Text(
            'No Route Found',
          ),
        ),
      ),
    );
  }
}
