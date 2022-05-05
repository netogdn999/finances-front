import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'controllers/controllers.dart';
import 'routes_managers/module_navigator_manager.dart';
import 'routes_managers/route_manager.dart';

class FacilyNavigator<NavigatorModule, NavigatorRoute> extends StatelessWidget {
  final NavigatorModule initialModule;
  final NavigatorRoute initialRoute;
  final List<RouteManager<NavigatorModule, NavigatorRoute>> routeManagerList;

  const FacilyNavigator({
    Key? key,
    required this.initialModule,
    required this.initialRoute,
    required this.routeManagerList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NavigatorModuleBloc>(
      create: (_) => NavigatorModuleBloc(
        initialModule: initialModule,
        initialRoute: initialRoute,
      ),
      child: ModuleNavigatorManager<NavigatorModule, NavigatorRoute>(
        initialModule: initialModule,
        initialRoute: initialRoute,
        modules: routeManagerList,
      ),
    );
  }
}
