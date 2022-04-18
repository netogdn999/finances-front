import 'package:flutter/material.dart';

import 'controller/module_navigator_bloc.dart';

class CustomRoute<RouteName> {
  final RouteName name;
  final Widget Function(ModuleNavigatorState) child;

  const CustomRoute(
      {Key? key,
      required this.name,
      required this.child});
}
