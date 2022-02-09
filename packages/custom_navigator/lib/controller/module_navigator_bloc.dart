import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:custom_navigator/custom_route.dart';
import 'package:meta/meta.dart';

part 'module_navigator_event.dart';
part 'module_navigator_state.dart';

class ModuleNavigatorBloc extends Bloc<ModuleNavigatorEvent, ModuleNavigatorState> {
  ModuleNavigatorBloc() : super(ModuleNavigatorInitial()) {
    on<PushToRoute>(pushToRoute);
    on<PopToRoute>(popToRoute);
    on<ModuleRenderRouteDone>(moduleRenderRouteDone);
  }

  FutureOr<void> pushToRoute(PushToRoute event, Emitter<ModuleNavigatorState> emit) {
    emit(ModulePreparingRoute());
    emit(ModuleRenderRoute());
  } 

  FutureOr<void> popToRoute(PopToRoute event, Emitter<ModuleNavigatorState> emit) {
    
  } 

  FutureOr<void> moduleRenderRouteDone(ModuleRenderRouteDone event, Emitter<ModuleNavigatorState> emit) {
    emit(ModuleNavigatorInitial());
  } 
}