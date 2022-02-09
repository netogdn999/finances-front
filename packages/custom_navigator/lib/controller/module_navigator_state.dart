part of 'module_navigator_bloc.dart';

@immutable
abstract class ModuleNavigatorState {}

class ModuleNavigatorInitial extends ModuleNavigatorState {}

class ModulePreparingRoute extends ModuleNavigatorState {}

class ModuleRenderRoute extends ModuleNavigatorState {}
