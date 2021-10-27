import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

import 'modules/shared_components/shared_components.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Storybook(
      children: [
        ...SharedComponents.stories
      ],
    );
  }
}
