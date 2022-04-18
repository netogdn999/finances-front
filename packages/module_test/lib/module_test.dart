library module_test;

import 'package:domain/core/navigator_name.dart';
import 'package:custom_navigator/custom_navigator.dart';
import 'package:flutter/material.dart';

class ModuleTest extends Module<ModuleName, RouteName> {
  ModuleTest()
      : super(
          name: ModuleName.moduleTest,
          initialRoute: RouteName.home,
          routes: [
            CustomRoute(
              name: RouteName.home,
              child: (state) => const Center(
                child: Text('Gaby minha melhor amiga'),
              ),
            ),
            CustomRoute(
              name: RouteName.details,
              child: (state) => const Center(
                child: Text('Mas ele tem outro(s) amigos'),
              ),
            )
          ],
        );
}
