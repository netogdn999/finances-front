import 'package:domain/core/contract_name.dart';
import 'package:domain/entities/contract.dart';
import 'package:domain/entities/graphics_contract.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:shared_components/components/graphics.dart';

class GraphicsStory {
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
        
        return Graphics(color: color);
      },
    )
  ]; 
}