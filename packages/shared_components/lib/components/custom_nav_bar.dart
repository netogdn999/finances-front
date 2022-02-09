import 'package:domain/entities/custom_nav_bar_contract.dart';
import 'package:flutter/material.dart';

part 'custom_item_nav.dart';

class CustomNavBar extends StatefulWidget {
  final Color? backgroundColor;
  final List<BottomNavigationBarItem> items;

  const CustomNavBar({
    Key? key,
    this.backgroundColor,
    required this.items,
  })  : assert(items.length >= 2 && items.length <= 5),
        super(key: key);

  static CustomNavBar fromDto(CustomNavBarContract contract) {
    List<BottomNavigationBarItem> items = contract.items
        .map(
          (item) => BottomNavigationBarItem(
            icon: Icon(
              IconData(item.icon, fontFamily: 'MaterialIcons'),
              size: 26,
            ),
            label: item.label,
          ),
        )
        .toList();

    return CustomNavBar(
      backgroundColor: Colors.white,
      items: items,
    );
  }

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFCAD3DD).withOpacity(0.3),
            spreadRadius: 0,
            blurRadius: 25,
            offset: const Offset(0, -10), // changes position of shadow
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          backgroundColor: widget.backgroundColor,
          items: widget.items,
        ),
      ),
    );
  }
}
