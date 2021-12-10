import 'package:domain/core/contract_name.dart';
import 'package:domain/entities/contract.dart';

class CustomNavBarItemContract extends Contract {
  final int icon;
  final int color;

  CustomNavBarItemContract({required this.icon, required this.color}) : super(ContractName.customNavBarItem);
}
