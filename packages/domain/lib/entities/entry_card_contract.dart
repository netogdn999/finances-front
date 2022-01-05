import 'package:domain/core/contract_name.dart';
import 'package:domain/entities/contract.dart';

class EntryCardContract extends Contract {
  final String label;
  final double total;
  final double expense;
  EntryCardContract({required this.label, required this.total, required this.expense}) : super(ContractName.entryCard);
}
