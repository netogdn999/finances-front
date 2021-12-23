import 'package:domain/core/contract_name.dart';
import 'package:domain/entities/contract.dart';

class CustomBottomSheetContract extends Contract {
  final String title;
  final List<Contract> children;
  
  CustomBottomSheetContract({required this.title, required this.children}) : super(ContractName.customBottomSheet);
}
