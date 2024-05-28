import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:sizer/sizer.dart';

import 'package:systel/core/routes/routes.dart';

import 'core/routes/app_routes.dart';
import 'core/routes/app_routes_fun.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const keyApplicationId = 'LxGFrGFTYnOChgLLTnrrWQtHEVHDXIWC8hKivklY';
  const keyClientKey = 'Ialw3EAnt0ZN3JYugjCzmh5roSIbkf0SWb0w7BSv';
  const keyParseServerUrl = 'https://parseapi.back4app.com';
  await Parse().initialize(keyApplicationId, keyParseServerUrl,
      clientKey: keyClientKey, debug: true);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder:
        (BuildContext context, Orientation orientation, DeviceType deviceType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: NamedRoutes.login,
        onGenerateRoute: RouteGenerator.getRoute,
        navigatorKey: navigator,
      );
    });
  }
}
