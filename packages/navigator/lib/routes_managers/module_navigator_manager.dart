import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'route_manager.dart';
import '../controllers/controllers.dart';

class ModuleNavigatorManager<NavigatorModule, NavigatorRoute>
    extends StatefulWidget {
  final Iterable<RouteManager> modules;
  final NavigatorModule initialModule;
  final NavigatorRoute initialRoute;

  const ModuleNavigatorManager({
    Key? key,
    required this.modules,
    required this.initialRoute,
    required this.initialModule,
  }) : super(key: key);

  @override
  State<ModuleNavigatorManager> createState() =>
      _ModuleNavigatorManagerState<NavigatorModule, NavigatorRoute>();
}

class _ModuleNavigatorManagerState<T, D> extends State<ModuleNavigatorManager> {
  List<RouteManager> modules = [];
  dynamic params;
  RouteManager? currentModule;
  late RouteManager nextModule;
  late T module;
  late D route;

  @override
  void initState() {
    super.initState();
    module = widget.initialModule;
    route = widget.initialRoute;
    currentModule = nextModule = _getNextModule();
  }

  void _navigateToPage(NavigatorModuleState state) {
    params = state.params;
    module = state.module;
    route = state.route ?? route;
  }

  void _navigatePopPage(NavigatorPopModuleState state) {
    nextModule = modules.removeLast();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NavigatorModuleBloc, NavigatorModuleState>(
      listener: (_, state) {
        if (state is NavigatorToModuleState ||
            state is NavigatorToModuleReplaceState) {
          _navigateToPage(state);
          nextModule = _getNextModule();
        }
        if (state is NavigatorToModuleState &&
            nextModule != currentModule &&
            currentModule != null) {
          modules.add(currentModule!);
          nextModule.pageNavigatorManager.numberOpenModules = modules.length;
          Map<String, dynamic>? params = state.params;
          if (params != null) {
            nextModule.params.addAll(params);
          }
        }
        if (state is NavigatorPopModuleState) {
          _navigatePopPage(state);
        }
        currentModule = nextModule;
      },
      builder: (_, state) => nextModule,
    );
  }

  RouteManager _getNextModule() => widget.modules.singleWhere(
        (nextAppRoute) => nextAppRoute.pageNavigatorManager
            .isThisRouteMine(module: module, params: params),
      );
}
