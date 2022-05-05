import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:navigator/controllers/controllers.dart';

enum NavigatorModule {
  mockModule,
}

enum NavigatorRoute {
  mockRoute,
}

void main() {
  late NavigatorModuleBloc navigatorModuleBloc;

  setUp(() {
    navigatorModuleBloc = NavigatorModuleBloc(
      initialModule: NavigatorModule.mockModule,
      initialRoute: NavigatorRoute.mockRoute,
    );
  });

  group('Navigator Module Bloc', () {
    test('Initial state should be NavigatorModuleInitialState', () async {
      // Assert
      expect(
        navigatorModuleBloc.state,
        const TypeMatcher<NavigatorModuleInitialState>(),
      );
    });

    blocTest(
      'Should emit [NavigatorToModuleState] when NavigatorToModuleEvent is added',
      build: () => navigatorModuleBloc,
      act: (NavigatorModuleBloc b) => b.add(
        NavigatorToModuleEvent(
          module: NavigatorModule.mockModule,
          route: NavigatorRoute.mockRoute,
          params: '',
        ),
      ),
      expect: () => const [
        TypeMatcher<NavigatorToModuleState>(),
      ],
    );

    blocTest(
      'Should emit [NavigatorToModuleReplaceState] when NavigatorToModuleReplaceEvent is added',
      build: () => navigatorModuleBloc,
      act: (NavigatorModuleBloc b) => b.add(
        NavigatorToModuleReplaceEvent(
          module: NavigatorModule.mockModule,
          route: NavigatorRoute.mockRoute,
          params: '',
        ),
      ),
      expect: () => const [
        TypeMatcher<NavigatorToModuleReplaceState>(),
      ],
    );

    blocTest(
      'Should emit [NavigatorPopModuleState] when NavigatorPopModuleEvent is added',
      build: () => navigatorModuleBloc,
      act: (NavigatorModuleBloc b) => b.add(NavigatorPopModuleEvent()),
      expect: () => const [
        TypeMatcher<NavigatorPopModuleState>(),
      ],
    );
  });
}
