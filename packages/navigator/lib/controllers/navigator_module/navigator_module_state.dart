abstract class NavigatorModuleState<NavigatorModule, NavigatorRoute> {
  final NavigatorModule? module;
  final NavigatorRoute? route;
  final dynamic params;

  NavigatorModuleState({
    this.module,
    this.route,
    this.params,
  });
}

class NavigatorModuleInitialState<NavigatorModule, NavigatorRoute>
  extends NavigatorModuleState {
  NavigatorModuleInitialState({
    required NavigatorModule module,
    NavigatorRoute? route,
  }) : super(
          module: module,
          route: route,
        );
}

class NavigatorToModuleState<NavigatorModule, NavigatorRoute>
  extends NavigatorModuleState {
  NavigatorToModuleState({
    required NavigatorModule module,
    NavigatorRoute? route,
    dynamic params,
  }) : super(
    module: module,
    route: route,
    params: params,
  );
}

class NavigatorToModuleReplaceState<NavigatorModule, NavigatorRoute>
  extends NavigatorModuleState {
  NavigatorToModuleReplaceState({
    required NavigatorModule module,
    NavigatorRoute? route,
    dynamic params,
  }) : super(
    module: module,
    route: route,
    params: params,
  );
}

class NavigatorPopModuleState extends NavigatorModuleState {
  NavigatorPopModuleState() : super();
}
