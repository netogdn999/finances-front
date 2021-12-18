import 'package:flutter/widgets.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:shared_components/components/custom_app_bar.dart';

class CustomAppBarStory {
  static Iterable<Story> get stories => [
        Story(
          section: 'Shared Components',
          name: 'CustomAppBar',
          builder: (_, knobs) {
            return CustomAppBar(
              image: Image.network(
                'https://i.ibb.co/tYmgqRq/perfil.jpg',
                height: 40,
                width: 40,
                fit: BoxFit.cover,
              ),
            );
          },
        )
      ];
}
