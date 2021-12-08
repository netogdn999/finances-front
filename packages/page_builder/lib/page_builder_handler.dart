import 'package:domain/core/contract_name.dart';
import 'package:flutter/material.dart';
import 'package:page_builder/presentation/page/page_contract.dart';
import 'package:shared_components/components/custom_app_bar.dart';
import 'package:shared_components/components/graphics.dart';

class PageBuilderHandler {
  final Map<String, Function> components = {
    ContractName.graphics: Graphics.fromDto,
    ContractName.customAppBar: CustomAppBar.fromDto
  };

  PageBuilderHandler();

  PreferredSizeWidget? getAppBar(PageContract page) {
    final fromDto = components[page.appBar?.contractName];
    if (fromDto != null) {
      return fromDto.call(page.appBar);
    }
  }

  List<Widget> getWidgets(PageContract page) {
    final List<Widget> result = [];
    for (var contract in page.components) {
      final fromDto = components[contract.contractName];
      if (fromDto != null) {
        result.add(fromDto.call(contract));
      }
    }
    return result;
  }
}
