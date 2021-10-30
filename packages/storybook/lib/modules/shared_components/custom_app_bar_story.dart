import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:shared_components/components/custom_app_bar.dart';

class CustomAppBarStory {
  static Iterable<Story> get stories => [
    Story(
      section: 'Shared Components',
      name: 'CustomAppBar',
      builder: (_, knobs) {
        return const CustomAppBar();
      },
    )
  ]; 
}