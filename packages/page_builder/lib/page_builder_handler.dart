import 'package:domain/core/contract_name.dart';
import 'package:domain/entities/contract.dart';
import 'package:flutter/material.dart';
import 'package:shared_components/components/graphics.dart';

class PageBuilderHandler {
  final Map<String, Function> components = {
    ContractName.graphics: Graphics.fromDto
  };

  PageBuilderHandler();

  List<Widget> getWidgets(List<Contract> contracts) {
    final List<Widget> result = [];
    for (var contract in contracts) {
      final fromDto = components[contract.contractName];
      if (fromDto != null) {
        result.add(fromDto.call(contract));
      }
    }
    return result;
  }
}
