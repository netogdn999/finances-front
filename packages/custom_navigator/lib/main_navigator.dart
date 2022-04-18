import 'package:custom_navigator/controller/module_navigator_bloc.dart';
import 'package:custom_navigator/controller/module_navigator_controller.dart';
import 'package:custom_navigator/module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainNavigator<ModuleName> extends StatefulWidget {
  final List<Module> modules;
  final ModuleName initialModule;
  late final ModuleNavigatorController delegate;

  MainNavigator({Key? key, required this.initialModule, required this.modules})
      : super(key: key) {
    delegate = ModuleNavigatorController(
        modules: modules, currentModule: initialModule);
  }

  @override
  _MainNavigatorState createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  @override
  Widget build(BuildContext context) {
    final initialModule = widget.modules
        .firstWhere((element) => element.name == widget.initialModule);

    return BlocProvider(
      create: (_) => ModuleNavigatorBloc(
          ModuleNavigatorInitial(routeName: initialModule.initialRoute)),
      child: MaterialApp.router(
        routeInformationParser: initialModule,
        routerDelegate: widget.delegate,
        theme: ThemeData(
          canvasColor: Colors.transparent,
        ),
      ),
    );
  }
}
