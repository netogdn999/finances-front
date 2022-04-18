import 'package:flutter_bloc/flutter_bloc.dart';

import 'controller/module_navigator_bloc.dart';

class NavigatorActions<ModuleName, RouteName> {
  final ModuleNavigatorBloc moduleNavigatorBloc;

  const NavigatorActions({required this.moduleNavigatorBloc});
  
  navigateToRoute(RouteName routeName, {dynamic params}) {
    moduleNavigatorBloc.add(NavigateToRouteEvent(routeName, params));
  }
}