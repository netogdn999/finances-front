import 'package:domain/core/contract_name.dart';
import 'package:domain/entities/contract.dart';

class GraphicsContract extends Contract {
  final double? width;
  final int? color;
  GraphicsContract({this.width, this.color}) : super(ContractName.graphics);
}
