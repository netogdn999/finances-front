import 'package:domain/core/contract_name.dart';
import 'package:domain/entities/contract.dart';

import 'custom_item_nav_contract.dart';

class CustomBottomNavigationBarContract extends Contract {
  final int? backgroundColor;
  final int activeColor;
  final int inactiveColor;
  final List<CustomNavBarItemContract> items;
  final double containerHeight;

  CustomBottomNavigationBarContract({this.backgroundColor, required this.activeColor, required this.inactiveColor, required this.items, required this.containerHeight}) : super(ContractName.customBottomApp);
}
