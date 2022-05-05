import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controllers/controllers.dart';
import '../facily_route.dart';
import '../navigator_action.dart';

late NavigatorAction kNavigatorAction;

class PageNavigatorManager<NavigatorModule, NavigatorRoute>
    extends RouterDelegate<FacilyRoute>
    with PopNavigatorRouterDelegateMixin<FacilyRoute> {
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  final Iterable<FacilyRoute> routes;

  final Function()? onFinish;

  final bool routeFixed;

  List<MaterialPage> _pages = [];

  final NavigatorPageBloc pageController;

  late NavigatorModuleBloc _moduleController;
  int _numberOpenModules = 0;
  set numberOpenModules(int numberOpenModules) {
    _numberOpenModules = numberOpenModules;
  }

  PageNavigatorManager({
    required this.routes,
    required this.pageController,
    required this.routeFixed,
    this.onFinish,
  }) : navigatorKey = GlobalKey();

  bool isThisRouteMine({
    required NavigatorModule module,
    dynamic params,
  }) =>
      routes.where((element) => element.module == module).isNotEmpty;

  @override
  Widget build(BuildContext context) {
    _moduleController = context.read<NavigatorModuleBloc>();
    kNavigatorAction = NavigatorAction<NavigatorModule, NavigatorRoute>(
      _moduleController,
      pageController,
    );
    return BlocConsumer<NavigatorPageBloc, NavigatorPageState>(
      listener: (_, state) {
        if (state is NavigatorPopState) {
          popRoute();
        }
      },
      builder: (_, state) {
        if (state is NavigatorToPageState ||
            state is NavigatorInitialState ||
            state is NavigatorToPageReplaceState) {
          if (state is NavigatorToPageReplaceState) {
            _pages.clear();
          }

          if (routeFixed && routes.isNotEmpty) {
            FacilyRoute page = routes.first;
            _pages.add(
              MaterialPage(
                child: page.child(state),
                arguments: page,
              ),
            );
          } else {
            FacilyRoute emptyRoute =
                FacilyRoute(module: '', route: '', child: (_) => Container());
            final newTopRoute = routes.firstWhere(
              (element) => element.route == state.route,
              orElse: () => emptyRoute,
            );

            if (newTopRoute != emptyRoute) {
              _pages.add(
                MaterialPage(
                  key: ValueKey('${newTopRoute.module}/${newTopRoute.route}'),
                  child: newTopRoute.child(state),
                  arguments: state.params,
                ),
              );
            }
          }

          pageController.add(NavigationCompleteEvent());
        }

        return Navigator(
          key: navigatorKey,
          onPopPage: _onPopPage,
          pages: List.unmodifiable(_pages),
        );
      },
    );
  }

  @override
  Future<bool> popRoute() {
    if (_numberOpenModules == 0) {
      if (_pages.length <= 1 && onFinish != null) {
        onFinish!();
      }
      pageController.add(NavigationCompleteEvent());
      return super.popRoute();
    }
    _numberOpenModules--;
    _moduleController.add(NavigatorPopModuleEvent());

    return SynchronousFuture<bool>(true);
  }

  bool _onPopPage(Route<dynamic> route, dynamic result) {
    if (!route.didPop(result)) {
      return false;
    }
    _pages.removeLast();
    pageController.add(NavigationCompleteEvent());

    return true;
  }

  @override
  Future<void> setNewRoutePath(FacilyRoute configuration) {
    return SynchronousFuture(null);
  }

  @override
  void addListener(VoidCallback listener) {}

  @override
  void removeListener(VoidCallback listener) {}
}
