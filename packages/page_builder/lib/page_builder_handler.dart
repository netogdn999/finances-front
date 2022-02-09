import 'package:domain/core/contract_name.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:page_builder/presentation/page/page_contract.dart';
import 'package:shared_components/components/components.dart';

class PageBuilderHandler {
  final Map<String, Function> components = {
    ContractName.graphics: Graphics.fromDto,
    ContractName.customAppBar: CustomAppBar.fromDto,
    ContractName.customNavBar: CustomNavBar.fromDto,
    ContractName.customBottomSheet: CustomBottomSheet.fromDto,
    ContractName.listLaunchCard: ListLaunchCard.fromDto,
    ContractName.listCategoryCard: ListCategoryCard.fromDto
  };

  PageBuilderHandler();

  PreferredSizeWidget? getAppBar(PageContract page) {
    final fromDto = components[page.appBar?.contractName];
    if (fromDto != null) {
      return fromDto.call(page.appBar);
    }
  }

  Widget? getBottomSheet(PageContract page) {
    final fromDto = components[page.bottomSheet?.contractName];
    if (fromDto != null) {
      return fromDto.call(page.bottomSheet);
    }
  }

  Widget? getBottomNavBar(PageContract page) {
    final fromDto = components[page.bottomNavBar?.contractName];
    if (fromDto != null) {
      return fromDto.call(page.bottomNavBar);
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
