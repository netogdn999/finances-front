import 'package:domain/domain.dart';

class PageContract {
  final Contract? appBar;
  final Contract? bottomSheet;
  final Contract? bottomNavBar;
  final List<Contract> components;

  PageContract({required this.components, this.appBar, this.bottomSheet, this.bottomNavBar});
}
