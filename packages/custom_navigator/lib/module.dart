import 'package:custom_navigator/custom_route.dart';
import 'package:flutter/material.dart';
class Module<ModuleName, RouteName> extends RouteInformationParser<CustomRoute> {
  final ModuleName name;
  final RouteName initialRoute;
  final List<CustomRoute> routes;
  final bool isFixedRoute;

  Module({required this.name, required this.initialRoute, required this.routes, this.isFixedRoute = false});

  @override
  Future<CustomRoute> parseRouteInformation(RouteInformation routeInformation) async {
    return routes.first;
  }
}