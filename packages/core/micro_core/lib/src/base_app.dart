import 'package:flutter/material.dart';

import 'micro_app.dart';
import 'micro_core_utils.dart';

mixin BaseApp {
  List<MicroApp> get microApps;

  Map<String, WidgetBuilderArgs> get baseRoutes;

  final Map<String, WidgetBuilderArgs> routes = {};

  void registerRoutes() {
    if (baseRoutes.isNotEmpty) routes.addAll(baseRoutes);
    if (microApps.isNotEmpty) {
      for (MicroApp microApp in microApps) {
        routes.addAll(microApp.routes);
      }
    }
  }

  void injectionsRegister() {
    if (microApps.isNotEmpty) {
      for (MicroApp microApp in microApps) {
        microApp.injectionsRegister();
      }
    }
  }

  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    final routeName = settings.name;
    final routeArgs = settings.arguments;

    final navigateTo = routes[routeName];
    if (navigateTo == null) return null;
    return MaterialPageRoute(
      builder: (context) => navigateTo.call(context, routeArgs),
    );
  }
}
