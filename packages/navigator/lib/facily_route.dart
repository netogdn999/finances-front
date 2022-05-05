import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'controllers/controllers.dart';

class FacilyRoute<NavigatorModule, NavigatorRoute> {
  final NavigatorModule module;
  final NavigatorRoute route;
  final Widget Function(NavigatorPageState) child;

  FacilyRoute({
    required this.module,
    required this.route,
    required this.child,
  });
}
