import 'package:custom_navigator/custom_navigator.dart';
import 'package:custom_navigator/custom_route.dart';
import 'package:page_builder/page_builder_widgets.dart';

class ModuleNavigator extends Module {
  ModuleNavigator()
      : super(
          routes: [
            CustomRoute(
              name: 'page_builder',
              child: PageBuilderWidgets(
                page: 'home',
              ),
            )
          ],
        );
}
