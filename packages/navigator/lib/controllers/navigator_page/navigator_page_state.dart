abstract class NavigatorPageState<NavigatorRoute> {
  final NavigatorRoute? route;
  final dynamic params;

  NavigatorPageState({this.route, this.params});
}

class NavigatorInitialState<NavigatorRoute> extends NavigatorPageState {
  NavigatorInitialState(NavigatorRoute route, params)
      : super(route: route, params: params);
}

class NavigatorToPageState<NavigatorRoute> extends NavigatorPageState {
  NavigatorToPageState(
    NavigatorRoute route, {
    dynamic params,
  }) : super(route: route, params: params);
}

class NavigatorToPageReplaceState<NavigatorRoute> extends NavigatorPageState {
  NavigatorToPageReplaceState(
    NavigatorRoute route, {
    dynamic params,
  }) : super(route: route, params: params);
}

class NavigatorPopState extends NavigatorPageState {
  NavigatorPopState() : super();
}

class NavigationCompleteState extends NavigatorPageState {
  NavigationCompleteState() : super();
}
