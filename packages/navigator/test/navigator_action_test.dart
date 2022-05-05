import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:navigator/controllers/controllers.dart';
import 'package:navigator/navigator.dart';

class MockNavigatorModuleBloc extends MockBloc<NavigatorModuleEvent, NavigatorModuleState> implements NavigatorModuleBloc {}

class FakeNavigatorModuleState extends Fake implements NavigatorModuleState {}

class FakeNavigatorModuleEvent extends Fake implements NavigatorModuleEvent {}

class MockNavigatorPageBloc extends MockBloc<NavigatorPageEvent, NavigatorPageState> implements NavigatorPageBloc {}

class FakeNavigatorPageState extends Fake implements NavigatorPageState {}

class FakeNavigatorPageEvent extends Fake implements NavigatorPageEvent {}

enum NavigatorRoute {
  pageOne,
}

enum NavigatorModule {
  moduleOne,
}

void main() {
  late MockNavigatorModuleBloc mockNavigatorModuleBloc;
  late MockNavigatorPageBloc mockNavigatorPageBloc;
  late NavigatorAction navigatorAction;

  setUp(() {
    registerFallbackValue(FakeNavigatorModuleState());
    registerFallbackValue(FakeNavigatorModuleEvent());
    registerFallbackValue(FakeNavigatorPageState());
    registerFallbackValue(FakeNavigatorPageEvent());

    mockNavigatorModuleBloc = MockNavigatorModuleBloc();
    mockNavigatorPageBloc = MockNavigatorPageBloc();

    navigatorAction = NavigatorAction(
      mockNavigatorModuleBloc,
      mockNavigatorPageBloc,
    );
  });

  test(
    'should add event to [NavigatorModuleBloc] when [navigateToModule] is called',
    () {
      navigatorAction.navigateToModule(module: NavigatorModule.moduleOne);

      verify(() => mockNavigatorModuleBloc.add(any())).called(1);
    },
  );

  test(
    'should add event to [NavigatorModuleBloc] when [navigateToModuleReplace] is called',
    () {
      navigatorAction.navigateToModuleReplace(
        module: NavigatorModule.moduleOne,
      );

      verify(() => mockNavigatorModuleBloc.add(any())).called(1);
    },
  );

  test(
    'should add event to [NavigatorPageBloc] when [navigateToPage] is called',
    () {
      navigatorAction.navigateToPage(NavigatorRoute.pageOne);

      verify(() => mockNavigatorPageBloc.add(any())).called(1);
    },
  );

  test(
    'should add event to [NavigatorPageBloc] when [navigateToPageReplace] is called',
    () {
      navigatorAction.navigateToPageReplace(NavigatorRoute.pageOne);

      verify(() => mockNavigatorPageBloc.add(any())).called(1);
    },
  );

  test(
    'should add event to [NavigatorPageBloc] when [navigatorPopPage] is called',
    () {
      navigatorAction.navigatorPopPage();

      verify(() => mockNavigatorPageBloc.add(any())).called(1);
    },
  );
}
