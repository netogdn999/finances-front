import 'package:domain/domain.dart';

class PageContract {
  final Contract? appBar;
  final List<Contract> components;

  PageContract({required this.components, this.appBar});
}
