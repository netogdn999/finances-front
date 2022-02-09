part of 'module_navigator_bloc.dart';

@immutable
abstract class ModuleNavigatorEvent {}

class PushToRoute extends ModuleNavigatorEvent {
  final CustomRoute customRoute;
  final Map<String, dynamic> params;

  PushToRoute({required this.customRoute, required this.params});
}

class ModuleRenderRouteDone extends ModuleNavigatorEvent {}

class PopToRoute extends ModuleNavigatorEvent {}
