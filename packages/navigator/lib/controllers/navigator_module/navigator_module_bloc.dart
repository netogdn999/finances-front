import 'package:flutter_bloc/flutter_bloc.dart';
import '../../navigator.dart';

import 'navigator_module_event.dart';
import 'navigator_module_state.dart';

class NavigatorModuleBloc<NavigatorModule, NavigatorRoute>
    extends Bloc<NavigatorModuleEvent, NavigatorModuleState> {
  NavigatorModuleBloc({
    required NavigatorModule initialModule,
    required NavigatorRoute initialRoute,
  }) : super(
          NavigatorModuleInitialState(
            module: initialModule,
            route: initialRoute,
          ),
        ) {
    on<NavigatorToModuleEvent>(_navigateToModule);
    on<NavigatorToModuleReplaceEvent>(_navigateToModuleReplace);
    on<NavigatorPopModuleEvent>(_navigateOnPop);
  }

  void _navigateToModule(
    NavigatorToModuleEvent event,
    Emitter<NavigatorModuleState> emit,
  ) {
    emit(
      NavigatorToModuleState(
        module: event.module,
        route: event.route,
        params: event.params,
      ),
    );
  }

  void _navigateToModuleReplace(
    NavigatorToModuleReplaceEvent event,
    Emitter<NavigatorModuleState> emit,
  ) {
    emit(
      NavigatorToModuleReplaceState(
        module: event.module,
        route: event.route,
        params: event.params,
      ),
    );
  }

  void _navigateOnPop(
    NavigatorPopModuleEvent event,
    Emitter<NavigatorModuleState> emit,
  ) {
    emit(
      NavigatorPopModuleState(),
    );
  }
}
