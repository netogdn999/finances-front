import 'package:domain/core/contract_name.dart';
import 'package:domain/entities/contract.dart';
import 'package:domain/entities/entry_card_contract.dart';

class ListEntryCardContract extends Contract {
  final List<EntryCardContract> children;

  ListEntryCardContract({required this.children}) : super(ContractName.entryCard);
}
