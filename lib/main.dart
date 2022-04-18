import 'package:domain/core/navigator_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:module_test/module_test.dart';
import 'package:page_builder/page_builder.dart';
import 'package:custom_navigator/custom_navigator.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(
        canvasColor: Colors.transparent,
      ),
      home: RepositoryProvider<RepositoryInterface>(
        create: (_) => Repository(RemoteDataSource()),
        child: BlocProvider<PageBuilderController>(
          create: (context) =>
              PageBuilderController(context.read<RepositoryInterface>()),
          child: MainNavigator<ModuleName>(
            initialModule: ModuleName.pageBuilder,
            modules: [
              PageBuilderModule(),
              ModuleTest(),
            ],
          ),
        ),
      ),
    );
  }
}
