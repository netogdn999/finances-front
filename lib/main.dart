import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_builder/page_builder.dart';

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
          create: (context) => PageBuilderController(context.read<RepositoryInterface>()),
          child: PageBuilderWidgets(page: "home"),
        ),
      ),
    );
  }
}
