import 'package:flutter/material.dart';
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
      home: PageBuilder(),
    );
  }
}
