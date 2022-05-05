import 'package:flutter_test/flutter_test.dart';
import 'package:navigator/navigator.dart';
import 'package:mocktail/mocktail.dart';

class MockPageNavigatorManager extends Mock implements PageNavigatorManager {}

void main() {
  late MockPageNavigatorManager mockPageNavigatorManager;
  late FacilyBackButtonDispatcher buttonDispatcher;

  setUp(() {
    mockPageNavigatorManager = MockPageNavigatorManager();
    buttonDispatcher = FacilyBackButtonDispatcher(mockPageNavigatorManager);
  });

  testWidgets(
    'should execute method [popRoute] when [didPopRoute] is called',
    (tester) async {
      when(
        () => mockPageNavigatorManager.popRoute(),
      ).thenAnswer((_) async => true);

      await buttonDispatcher.didPopRoute();

      verify(() => mockPageNavigatorManager.popRoute());
    },
  );
}
