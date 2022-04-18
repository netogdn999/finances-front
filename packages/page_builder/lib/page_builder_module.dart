import 'package:custom_navigator/controller/module_navigator_bloc.dart';
import 'package:custom_navigator/custom_navigator.dart';
import 'package:domain/core/navigator_name.dart';
import 'package:page_builder/page_builder_widgets.dart';

class PageBuilderModule extends Module<ModuleName, RouteName> {
  PageBuilderModule()
      : super(
          name: ModuleName.pageBuilder,
          initialRoute: RouteName.home,
          routes: [
            CustomRoute<RouteName>(
              name: RouteName.home,
              child: (ModuleNavigatorState state) => PageBuilderWidgets(
                page: state.routeName,
              ),
            )
          ],
        );
}
