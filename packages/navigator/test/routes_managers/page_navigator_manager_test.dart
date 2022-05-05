import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:navigator/navigator.dart';
import 'package:mocktail/mocktail.dart';

class MockNavigatorPageBloc extends MockBloc<NavigatorPageEvent, NavigatorPageState> implements NavigatorPageBloc {}

class FakeNavigatorPageState extends Fake implements NavigatorPageState {}

class FakeNavigatorPageEvent extends Fake implements NavigatorPageEvent {}

enum NavigatorRoute {
  pageOne,
  pageTwo,
}

enum NavigatorModule {
  moduleOne,
  moduleTwo,
}

void main() {
  late PageNavigatorManager navigatoManager;
  late MockNavigatorPageBloc mockNavigatorPageBloc;

  final Iterable<FacilyRoute> mockRoutes = [
    FacilyRoute(
      module: NavigatorModule.moduleOne,
      route: NavigatorRoute.pageOne,
      child: (_) => Container(),
    ),
  ];

  setUp(() {
    registerFallbackValue(FakeNavigatorPageState());
    registerFallbackValue(FakeNavigatorPageEvent());

    mockNavigatorPageBloc = MockNavigatorPageBloc();

    navigatoManager = PageNavigatorManager(
      routes: mockRoutes,
      pageController: mockNavigatorPageBloc,
      routeFixed: false,
    );
  });

  group('[isThisRoutMine] method validation', () {
    test('should return true when the pages belongs to module', () {
      final result = navigatoManager.isThisRouteMine(
        module: NavigatorModule.moduleOne,
      );

      expect(result, true);
    });

    test('should return false when the pages not belongs to module', () {
      final result = navigatoManager.isThisRouteMine(
        module: NavigatorModule.moduleTwo,
      );

      expect(result, false);
    });
  });
}
