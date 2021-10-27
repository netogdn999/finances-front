import 'package:storybook_flutter/storybook_flutter.dart';

import 'graphics_story.dart';

class SharedComponents {
  static Iterable<Story> get stories => [
   ...GraphicsStory.stories,
  ]; 
}