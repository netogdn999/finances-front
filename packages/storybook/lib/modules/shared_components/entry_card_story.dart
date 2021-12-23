import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:shared_components/components/entry_card.dart';

class EntryCardStory {
  static Iterable<Story> get stories => [
        Story(
          section: 'Shared Components',
          name: 'EntryCard',
          builder: (_, knobs) {
            return SizedBox(
              height: 300,
              width: 200,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  EntryCard(
                    label: "Tarifas",
                    total: 400000,
                    expense: 8500,
                  ),
                ],
              ),
            );
          },
        )
      ];
}
