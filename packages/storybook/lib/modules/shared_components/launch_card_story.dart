import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:shared_components/components/launch_card.dart';

class LaunchCardStory {
  static Iterable<Story> get stories => [
    Story(
      section: 'Shared Components',
      name: 'LaunchCard',
      builder: (_, knobs) {
        return const LaunchCard(
          title: "Casa do Henrique",
          height: 80,
          width: 343,
          value: 100.70,
          date: "20 Março, 09:00 AM",
        );
      },
    )
  ]; 
}