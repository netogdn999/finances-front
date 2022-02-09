import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:shared_components/components/launch_card.dart';

class ListLaunchCard extends StatelessWidget {
  final List<LaunchCard> children;

  const ListLaunchCard({
    Key? key,
    required this.children,
  }) : super(key: key);

  static ListLaunchCard fromDto(ListLaunchCardContract contract) {
    List<LaunchCard> children = contract.children
        .map(
          (launchCard) => LaunchCard(
            date: launchCard.date,
            height: launchCard.height,
            title: launchCard.title,
            value: launchCard.value,
            width: launchCard.width,
          ),
        )
        .toList();

    return ListLaunchCard(children: children);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        padding: EdgeInsets.symmetric(vertical: 10),
        shrinkWrap: true,
        itemCount: children.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (_, index) {
          return children[index];
        },
        separatorBuilder: (_, __) => SizedBox(
          height: 12,
        ),
      ),
    );
  }
}
