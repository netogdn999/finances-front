import 'package:domain/core/contract_name.dart';
import 'package:domain/entities/contract.dart';

import 'custom_item_nav_contract.dart';

class CustomNavBarContract extends Contract {
  final int? backgroundColor;
  final List<CustomNavBarItemContract> items;

  CustomNavBarContract({this.backgroundColor, required this.items}) : super(ContractName.customNavBar);
}
