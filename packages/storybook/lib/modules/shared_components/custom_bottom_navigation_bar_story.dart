import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_components/components/custom_bottom_navigation_bar.dart';
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

            int _currentIndex = 0;

            return CustomBottomNavigationBar(
              containerHeight: 70,
              backgroundColor: color,
              activeColor: activeColor,
              inactiveColor: inactiveColor,
              selectedIndex: _currentIndex,
              items: <BottomNavBarItem>[
                BottomNavBarItem(
                  icon: const Icon(Icons.home),
                  title: const Text('Home'),
                  textAlign: TextAlign.center,
                ),
                BottomNavBarItem(
                  icon: const Icon(Icons.graphic_eq),
                  title: const Text('Graphics'),
                  textAlign: TextAlign.center,
                ),
                BottomNavBarItem(
                  icon: const Icon(Icons.account_balance_wallet),
                  title: const Text('Wallet'),
                  textAlign: TextAlign.center,
                ),
                BottomNavBarItem(
                  icon: const Icon(Icons.perm_identity),
                  title: const Text('People'),
                  textAlign: TextAlign.center,
                ),
              ],
            );
          },
        )
      ];
}