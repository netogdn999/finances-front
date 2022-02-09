import 'package:flutter/material.dart';

class CustomRoute extends StatelessWidget {
  final String name;
  final Widget child;

  const CustomRoute({Key? key, required this.name, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return child;
  }
}