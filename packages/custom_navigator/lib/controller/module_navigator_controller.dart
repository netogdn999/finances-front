import 'package:custom_navigator/controller/module_navigator_bloc.dart';
import 'package:custom_navigator/custom_route.dart';
import 'package:custom_navigator/module.dart';
import 'package:custom_navigator/navigator_actions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

late NavigatorActions navigatorActions;

class ModuleNavigatorController<ModuleName, RouteName>
    extends RouterDelegate<CustomRoute>
    with PopNavigatorRouterDelegateMixin<CustomRoute> {
  final List<Module> modules;
  late ModuleName currentModule;
  late ModuleNavigatorBloc moduleNavigatorBloc;
  final List<MaterialPage> navigatorStack = [];

  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  ModuleNavigatorController(
      {Key? key, required this.modules, required this.currentModule});

  @override
  Widget build(BuildContext context) {
    moduleNavigatorBloc = context.read<ModuleNavigatorBloc>();

    navigatorActions =
        NavigatorActions(moduleNavigatorBloc: moduleNavigatorBloc);

    return BlocConsumer<ModuleNavigatorBloc, ModuleNavigatorState>(
      buildWhen: (previous, current) => current is! RouterRenderEndState,
      listener: (_, state) {
        if (state is NavigateToRouteState) {
          final MaterialPage page = _getPage(currentModule, state);
          navigatorStack.add(page);
          moduleNavigatorBloc.add(RouterRenderEndEvent());
        }
      },
      builder: (BuildContext context, ModuleNavigatorState state) {
        if (state is ModuleNavigatorInitial && navigatorStack.isEmpty) {
          final MaterialPage page = _getPage(currentModule, state);

          navigatorStack.add(page);
        }

        return Navigator(
          key: navigatorKey,
          pages: navigatorStack,
          onPopPage: (_, ___) => true,
        );
      },
    );
  }

  @override
  void addListener(VoidCallback listener) {
    // TODO: implement addListener
  }

  @override
  Future<bool> popRoute() async {
    return true;
  }

  @override
  void removeListener(VoidCallback listener) {
    // TODO: implement removeListener
  }

  @override
  Future<void> setNewRoutePath(configuration) async {
    // TODO: implement setNewRoutePath
  }

  MaterialPage _getPage(ModuleName moduleName, ModuleNavigatorState state) {
    final initialModule =
        modules.firstWhere((module) => module.name == moduleName);
    final routes = initialModule.routes;
    final route = routes.firstWhere((route) => route.name == state.routeName);

    return MaterialPage(child: route.child(state));
  }
}
