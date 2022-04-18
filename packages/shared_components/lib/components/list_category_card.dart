import 'package:custom_navigator/controller/module_navigator_controller.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:shared_components/components/category_card.dart';

class ListCategoryCard extends StatelessWidget {
  final List<CategoryCard> children;

  const ListCategoryCard({
    Key? key,
    required this.children,
  }) : super(key: key);

  static ListCategoryCard fromDto(ListCategoryCardContract contract) {
    List<CategoryCard> children = contract.children
        .map(
          (entryCard) => CategoryCard(
        expense: entryCard.expense,
        label: entryCard.label,
        total: entryCard.total,
      ),
    )
        .toList();

    return ListCategoryCard(children: children);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => navigatorActions.navigateToRoute(RouteName.details),
      child: SizedBox(
        height: 215,
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: children.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            return children[index];
          },
          separatorBuilder: (_, __) => const SizedBox(
            width: 16,
          ),
        ),
      ),
    );
  }
}
