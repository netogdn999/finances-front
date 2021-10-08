import 'package:finance/components/entry_manager/views/pages/entry_manager_page.dart';
import 'package:flutter/material.dart';

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(
        canvasColor: Colors.transparent,
      ),
      home: EntryManagerPage(),
    );
  }
}