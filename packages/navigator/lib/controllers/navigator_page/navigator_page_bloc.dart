import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'navigator_page_event.dart';
import 'navigator_page_state.dart';

class NavigatorPageBloc<NavigatorRoute>
    extends Bloc<NavigatorPageEvent, NavigatorPageState> {
  NavigatorPageBloc(NavigatorInitialState initialState) : super(initialState) {
    on<NavigatorToPageEvent>(_navigateToPage);
    on<NavigatorToPageReplaceEvent>(_navigateToPageReplace);
    on<NavigatorPopPageEvent>(_navigateOnPop);
    on<NavigationCompleteEvent>(_navigationComplete);
  }

  void _navigateToPage(
    NavigatorToPageEvent event,
    Emitter<NavigatorPageState> emit,
  ) {
    emit(
      NavigatorToPageState(
        event.route,
        params: event.params,
      ),
    );
  }

  void _navigateOnPop(
    NavigatorPopPageEvent event,
    Emitter<NavigatorPageState> emit,
  ) {
    emit(NavigatorPopState());
  }

  void _navigationComplete(
    NavigationCompleteEvent event,
    Emitter<NavigatorPageState> emit,
  ) {
    emit(NavigationCompleteState());
  }

  FutureOr<void> _navigateToPageReplace(
    NavigatorToPageReplaceEvent event,
    Emitter<NavigatorPageState> emit,
  ) {
    emit(
      NavigatorToPageReplaceState(
        event.route,
        params: event.params,
      ),
    );
  }
}
