abstract class NavigatorPageEvent<NavigatorRoute> {}

class NavigatorToPageEvent<NavigatorRoute> extends NavigatorPageEvent {
  NavigatorRoute route;
  dynamic params;

  NavigatorToPageEvent({
    required this.route,
    this.params,
  }) : super();
}

class NavigatorToPageReplaceEvent<NavigatorRoute> extends NavigatorPageEvent {
  NavigatorRoute route;
  dynamic params;
  NavigatorToPageReplaceEvent({required this.route, this.params}) : super();
}

class NavigatorPopPageEvent extends NavigatorPageEvent {}

class NavigationCompleteEvent extends NavigatorPageEvent {}
