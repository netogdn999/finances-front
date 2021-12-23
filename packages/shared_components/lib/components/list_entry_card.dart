import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:shared_components/components/entry_card.dart';

class ListEntryCard extends StatelessWidget {
  final List<EntryCard> children;

  const ListEntryCard({
    Key? key,
    required this.children,
  }) : super(key: key);

  static ListEntryCard fromDto(ListEntryCardContract contract) {
    List<EntryCard> children = contract.children
        .map((entryCard) => EntryCard(
              expense: entryCard.expense,
              label: entryCard.label,
              total: entryCard.total,
            ))
        .toList();

    return ListEntryCard(children: children);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: children.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return children[index];
        },
        separatorBuilder: (_, __) => const SizedBox(width: 16,),
      ),
    );
  }
}
