import 'package:flutter/material.dart';
import 'page_navigator_manager.dart';

class FacilyBackButtonDispatcher extends RootBackButtonDispatcher {
  final PageNavigatorManager _pageNavigatorManager;

  FacilyBackButtonDispatcher(this._pageNavigatorManager) : super();

  @override
  Future<bool> didPopRoute() {
    return _pageNavigatorManager.popRoute();
  }
}
