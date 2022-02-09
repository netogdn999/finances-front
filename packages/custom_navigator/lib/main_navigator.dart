import 'package:custom_navigator/controller/module_navigator_bloc.dart';
import 'package:custom_navigator/controller/module_navigator_controller.dart';
import 'package:custom_navigator/module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainNavigator extends StatefulWidget {
  final Module module;
  late final ModuleNavigatorController delegate;

  MainNavigator({Key? key, required this.module}) : super(key: key) {
    delegate = ModuleNavigatorController(module: module);
  }

  @override
  _MainNavigatorState createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ModuleNavigatorBloc(),
      child: MaterialApp.router(
          routeInformationParser: widget.module,
          routerDelegate: widget.delegate),
    );
  }
}
