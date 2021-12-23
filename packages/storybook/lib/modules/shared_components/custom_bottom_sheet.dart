import 'package:flutter/material.dart';
import 'package:shared_components/components/components.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class CustomBottomSheetStory {
  static Iterable<Story> get stories => [
        Story(
          section: 'Shared Components',
          name: 'CustomBottomSheet',
          builder: (_, knobs) {
            return Scaffold(
              body: Container(),
              bottomSheet: const CustomBottomSheet(
                title: "Categorias",
                children: [
                  EntryCard(
                    label: 'Tarifas',
                    total: 400000,
                    expense: 8500,
                  )
                ],
              ),
            );
          },
        )
      ];
}
