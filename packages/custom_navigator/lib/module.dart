import 'package:custom_navigator/custom_route.dart';
import 'package:flutter/material.dart';
class Module extends RouteInformationParser<CustomRoute> {
  final List<CustomRoute> routes;

  Module({required this.routes});

  @override
  Future<CustomRoute> parseRouteInformation(RouteInformation routeInformation) async {
    return routes.first;
  }
}