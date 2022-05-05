abstract class NavigatorModuleEvent<NavigatorModule, NavigatorRoute> {}

class NavigatorToModuleEvent<NavigatorModule, NavigatorRoute> 
  extends NavigatorModuleEvent {
  final NavigatorModule module;
  final NavigatorRoute? route;
  final dynamic params;

  NavigatorToModuleEvent({
    required this.module,
    required this.route,
    required this.params,
  });
}

class NavigatorToModuleReplaceEvent<NavigatorModule, NavigatorRoute>
  extends NavigatorModuleEvent {
  final NavigatorModule module;
  final NavigatorRoute? route;
  final dynamic params;

  NavigatorToModuleReplaceEvent({
    required this.module,
    required this.route,
    required this.params,
  });
}

class NavigatorPopModuleEvent extends NavigatorModuleEvent {}

class NavigatorReplaceModuleEvent extends NavigatorModuleEvent {}
