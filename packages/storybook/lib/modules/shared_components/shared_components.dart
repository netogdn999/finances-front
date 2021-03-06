import 'package:storybook/modules/shared_components/custom_app_bar_story.dart';
import 'package:storybook/modules/shared_components/custom_bottom_navigation_bar_story.dart';
import 'package:storybook/modules/shared_components/custom_bottom_sheet.dart';
import 'package:storybook/modules/shared_components/category_card_story.dart';
import 'package:storybook/modules/shared_components/launch_card_story.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

import 'graphics_story.dart';

class SharedComponents {
  static Iterable<Story> get stories => [
   ...GraphicsStory.stories,
   ...CustomAppBarStory.stories,
   ...CustomBottomNavigationBarStory.stories,
   ...CustomBottomSheetStory.stories,
   ...LaunchCardStory.stories,
   ...CategoryCardStory.stories,
  ]; 
}