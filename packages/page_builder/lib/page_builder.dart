import 'package:domain/domain.dart';
import 'package:domain/entities/contract.dart';
import 'package:flutter/material.dart';
import 'package:page_builder/page_builder_handler.dart';

class PageBuilder extends StatelessWidget {
  final PageBuilderHandler handler = PageBuilderHandler();
  PageBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: handler.getWidgets([
          GraphicsContract(
            color: 0xFF000000,
            height: 500
          )
        ]),
      ),
    );
  }
}
