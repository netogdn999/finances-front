import 'controllers/controllers.dart';

class NavigatorAction<NavigatorModule, NavigatorRoute> {
  NavigatorModuleBloc _controllerModule;
  NavigatorPageBloc _controllerPage;

  NavigatorAction(
    this._controllerModule,
    this._controllerPage,
  );

  void navigateToModule({
    required NavigatorModule module,
    NavigatorRoute? route,
    dynamic params,
  }) {
    _controllerModule.add(
      NavigatorToModuleEvent(
        module: module,
        route: route,
        params: params,
      ),
    );
  }

  void navigateToModuleReplace({
    required NavigatorModule module,
    NavigatorRoute? route,
    dynamic params,
  }) {
    _controllerModule.add(
      NavigatorToModuleReplaceEvent(
        module: module,
        route: route,
        params: params,
      ),
    );
  }

  void navigateToPage(NavigatorRoute route, {dynamic params}) {
    _controllerPage.add(
      NavigatorToPageEvent(
        route: route,
        params: params,
      ),
    );
  }

  void navigateToPageReplace(NavigatorRoute route, {dynamic params}) {
    _controllerPage.add(
      NavigatorToPageReplaceEvent(route: route, params: params),
    );
  }

  void navigatorPopPage() {
    _controllerPage.add(NavigatorPopPageEvent());
  }

  void navigatorPopModule() {
    _controllerModule.add(NavigatorPopModuleEvent());
  }
}
