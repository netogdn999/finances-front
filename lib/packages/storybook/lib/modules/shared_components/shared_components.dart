import 'package:finance/components/entry_manager/views/widgets/graph.dart';
import 'package:finance/packages/storybook/lib/modules/shared_components/graphics.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class SharedComponents {
  static Iterable<Story> get stories => [
   ...Graphics.stories,
  ]; 
}