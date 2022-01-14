import 'package:domain/core/contract_name.dart';
import 'package:domain/entities/contract.dart';

import 'launch_card_contract.dart';

class ListLaunchCardContract extends Contract {
  final List<LaunchCardContract> children;

  ListLaunchCardContract({required this.children}) : super(ContractName.listLaunchCard);
}
