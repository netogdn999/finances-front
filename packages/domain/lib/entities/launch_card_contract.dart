import 'package:domain/core/contract_name.dart';
import 'package:domain/entities/contract.dart';

class LaunchCardContract extends Contract {
  final String title;
  final double height;
  final double width;
  final double value;
  final String date;

  LaunchCardContract({required this.title, required this.height, required this.width, required this.value, required this.date}) : super(ContractName.launchCard);
}
