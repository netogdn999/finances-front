part of 'module_navigator_bloc.dart';

abstract class ModuleNavigatorState<RouteName> {
  final RouteName? routeName;
  final dynamic params;

  ModuleNavigatorState(this.routeName, this.params);
}

class ModuleNavigatorInitial<RouteName> extends ModuleNavigatorState {
  ModuleNavigatorInitial({required RouteName routeName, dynamic params}) : super(routeName, params);
}

class ModulePreparingRoute<RouteName> extends ModuleNavigatorState {
  ModulePreparingRoute(RouteName routeName, params) : super(routeName, params);
}

class ModuleRenderRoute<RouteName> extends ModuleNavigatorState {
  ModuleRenderRoute(RouteName routeName, params) : super(routeName, params);
}

class NavigateToRouteState<RouteName> extends ModuleNavigatorState {
  NavigateToRouteState({required RouteName routeName, dynamic params}) : super(routeName, params);
}

class RouterRenderEndState<RouteName> extends ModuleNavigatorState {
  RouterRenderEndState({RouteName? routeName, dynamic params}) : super(routeName, params);
}