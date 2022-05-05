import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controllers/navigator_page/navigator_page_bloc.dart';
import '../facily_route.dart';
import '../navigator.dart';
import 'routes_managers.dart';

abstract class RouteManager<NavigatorModule, NavigatorRoute>
    extends StatelessWidget {
  final Iterable<FacilyRoute> routes;
  final NavigatorRoute initialRoute;
  final Map<String, dynamic> params = {};
  final Function()? onFinish;

  late final PageNavigatorManager pageNavigatorManager;
  late final NavigatorPageBloc navigatorPageBloc;

  RouteManager({
    Key? key,
    required this.routes,
    required this.initialRoute,
    this.onFinish,
    bool routeFixed = false,
  }) : super(key: key) {
    NavigatorInitialState navigatorInitialState =
        NavigatorInitialState(initialRoute, params);
    navigatorPageBloc = NavigatorPageBloc(navigatorInitialState);
    pageNavigatorManager =
        PageNavigatorManager<NavigatorModule, NavigatorRoute>(
      routeFixed: routeFixed,
      routes: routes,
      pageController: navigatorPageBloc,
      onFinish: onFinish,
    );
  }

  Widget init(BuildContext context, Widget routerChild);

  @override
  Widget build(BuildContext context) {
    return init(
      context,
      BlocProvider.value(
        value: navigatorPageBloc,
        child: Router(
          routerDelegate: pageNavigatorManager,
          backButtonDispatcher:
              FacilyBackButtonDispatcher(pageNavigatorManager),
        ),
      ),
    );
  }
}
