import 'package:domain/core/contract_name.dart';
import 'package:domain/entities/contract.dart';

class CustomAppBarContract extends Contract {
  final String image;

  CustomAppBarContract({required this.image}) : super(ContractName.customAppBar);
}
