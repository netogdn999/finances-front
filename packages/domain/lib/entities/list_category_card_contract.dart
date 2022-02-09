import 'package:domain/core/contract_name.dart';
import 'package:domain/entities/contract.dart';

import 'category_card_contract.dart';

class ListCategoryCardContract extends Contract {
  final List<CategoryCardContract> children;

  ListCategoryCardContract({required this.children}) : super(ContractName.listCategoryCard);
}
