import 'package:flutter/material.dart';
import 'package:shared_components/components/components.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class CustomBottomNavigationBarStory {
  static Iterable<Story> get stories => [
        Story(
          section: 'Shared Components',
          name: 'CustomBottomApp',
          builder: (_, knobs) {
            final Color color = knobs.options(
                label: 'Color background',
                initial: const Color(0xffFEFEFE),
                options: const [
                  Option('Default', Color(0xffFEFEFE)),
                  Option('Black', Colors.black),
                  Option('White', Colors.white),
                  Option('Green', Colors.green),
                ]);

            final Color activeColor = knobs.options(
                label: 'Color active',
                initial: const Color(0xff2270D2),
                options: const [
                  Option('Default', Color(0xff2270D2)),
                  Option('Black', Colors.black),
                  Option('White', Colors.white),
                  Option('Green', Colors.green),
                ]);

            final Color inactiveColor = knobs.options(
                label: 'Color inactive',
                initial: const Color(0xffD6E0ED),
                options: const [
                  Option('Default', Color(0xffD6E0ED)),
                  Option('Black', Colors.black),
                  Option('White', Colors.white),
                  Option('Green', Colors.green),
                ]);

            return CustomNavBar(
              backgroundColor: color,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'home'
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.graphic_eq),
                  label: 'graphic'
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_balance_wallet),
                  label: 'wallet'
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.perm_identity),
                  label: 'user'
                ),
              ],
            );
          },
        )
      ];
}
