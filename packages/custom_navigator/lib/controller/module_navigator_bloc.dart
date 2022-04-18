import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:custom_navigator/custom_route.dart';
import 'package:meta/meta.dart';

part 'module_navigator_event.dart';
part 'module_navigator_state.dart';

class ModuleNavigatorBloc
    extends Bloc<ModuleNavigatorEvent, ModuleNavigatorState> {
  ModuleNavigatorBloc(ModuleNavigatorInitial moduleNavigatorInitial)
      : super(moduleNavigatorInitial) {
    // on<PushToRoute>(pushToRoute);
    on<PopToRoute>(popToRoute);
    // on<ModuleRenderRouteDone>(moduleRenderRouteDone);
    on<NavigateToRouteEvent>(navigateToRoute);
    on<RouterRenderEndEvent>(routerRenderEnd);
  }

  // FutureOr<void> pushToRoute(
  //     PushToRoute event, Emitter<ModuleNavigatorState> emit) {
  //   emit(ModulePreparingRoute());
  //   emit(ModuleRenderRoute());
  // }

  FutureOr<void> popToRoute(
      PopToRoute event, Emitter<ModuleNavigatorState> emit) {}

  // FutureOr<void> moduleRenderRouteDone(
  //     ModuleRenderRouteDone event, Emitter<ModuleNavigatorState> emit) {
  //   emit(ModuleNavigatorInitial());
  // }

  FutureOr<void> navigateToRoute(
      NavigateToRouteEvent event, Emitter<ModuleNavigatorState> emit) {
    emit(NavigateToRouteState(routeName: event.routeName, params: event.params));
  }

  FutureOr<void> routerRenderEnd(
      RouterRenderEndEvent event, Emitter<ModuleNavigatorState> emit) {
    emit(RouterRenderEndState());
  }
}
