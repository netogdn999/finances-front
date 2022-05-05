import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:navigator/controllers/controllers.dart';

enum NavigatorRoute {
  mockRoute,
}
void main() {
  late NavigatorPageBloc navigatorPageBloc;

  setUp(() {
    navigatorPageBloc =
        NavigatorPageBloc(NavigatorInitialState(NavigatorRoute.mockRoute, {}));
  });

  group('Navigator Page Bloc', () {
    test('Initial state should be NavigatorInitialState', () async {
      // Assert
      expect(
        navigatorPageBloc.state,
        const TypeMatcher<NavigatorInitialState>(),
      );
    });

    blocTest(
      'Should emit [NavigatorToPageState] when NavigatorToPageEvent is added',
      build: () => navigatorPageBloc,
      act: (NavigatorPageBloc b) => b.add(NavigatorToPageEvent(route: '')),
      expect: () => const [
        TypeMatcher<NavigatorToPageState>(),
      ],
    );

    blocTest(
      'Should emit [NavigatorPopState] when NavigatorPopPageEvent is added',
      build: () => navigatorPageBloc,
      act: (NavigatorPageBloc b) => b.add(NavigatorPopPageEvent()),
      expect: () => const [
        TypeMatcher<NavigatorPopState>(),
      ],
    );

    blocTest(
      'Should emit [NavigationCompleteState] when NavigationCompleteEvent is added',
      build: () => navigatorPageBloc,
      act: (NavigatorPageBloc b) => b.add(NavigationCompleteEvent()),
      expect: () => const [
        TypeMatcher<NavigationCompleteState>(),
      ],
    );

    blocTest(
      'Should emit [NavigatorToPageReplaceState] when NavigatorToPageReplaceEvent is added',
      build: () => navigatorPageBloc,
      act: (NavigatorPageBloc b) => b.add(
        NavigatorToPageReplaceEvent(route: ''),
      ),
      expect: () => const [
        TypeMatcher<NavigatorToPageReplaceState>(),
      ],
    );
  });
}
