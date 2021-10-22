import 'package:finance/components/entry_manager/views/widgets/graph.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class Graphics {
  static Iterable<Story> get stories => [
    Story(
      section: 'Shared Components',
      name: 'Graphics',
      builder: (_, knobs) {
        final Color color = knobs.options(label: 'Color', initial: Colors.white, options: const [
          Option('Black', Colors.black),
          Option('White', Colors.white),
          Option('Green', Colors.green),
        ]);
        
        return Graph(color: color,);
      },
    )
  ]; 
}