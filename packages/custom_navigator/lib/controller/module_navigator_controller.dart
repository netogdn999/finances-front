import 'package:custom_navigator/controller/module_navigator_bloc.dart';
import 'package:custom_navigator/custom_route.dart';
import 'package:custom_navigator/module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ModuleNavigatorController extends RouterDelegate<CustomRoute>
    with PopNavigatorRouterDelegateMixin<CustomRoute> {
  final Module module;

  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  ModuleNavigatorController({Key? key, required this.module});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      listener: (_, state) {
        if (state is ModulePreparingRoute) {}

        if (state is ModuleRenderRoute) {}
      },
      builder: (BuildContext context, Object? state) {
        final List<MaterialPage> pages = module.routes.map((route) => MaterialPage(child: route)).toList();

        return Navigator(
          key: navigatorKey,
          pages: pages,
        );
      },
    );
  }

  @override
  void addListener(VoidCallback listener) {
    // TODO: implement addListener
  }

  @override
  Future<bool> popRoute() {
    // TODO: implement popRoute
    throw UnimplementedError();
  }

  @override
  void removeListener(VoidCallback listener) {
    // TODO: implement removeListener
  }

  @override
  Future<void> setNewRoutePath(configuration) {
    // TODO: implement setNewRoutePath
    throw UnimplementedError();
  }
}
