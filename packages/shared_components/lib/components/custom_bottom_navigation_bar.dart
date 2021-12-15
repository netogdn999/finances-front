import 'package:flutter/material.dart';

part 'custom_item_nav.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int selectedIndex;
  final double iconSize;
  final Color? backgroundColor;
  final Color activeColor;
  final Color? inactiveColor;
  final List<BottomNavBarItem> items;
  final MainAxisAlignment mainAxisAlignment;
  final double containerHeight;

  const CustomBottomNavigationBar({
    Key? key,
    this.selectedIndex = 0,
    this.iconSize = 24,
    this.backgroundColor,
    this.activeColor = Colors.blue,
    this.inactiveColor = Colors.grey,
    this.containerHeight = 56,
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
    required this.items,
  })  : assert(items.length >= 2 && items.length <= 5),
        super(key: key);

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _currentIndex = 0;

  _onItemSelected(index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
        ),
        width: double.infinity,
        height: widget.containerHeight,
        padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 50),
        child: Row(
          mainAxisAlignment: widget.mainAxisAlignment,
          children: widget.items.map((item) {
            var index = widget.items.indexOf(item);
            item.activeColor = widget.activeColor;
            item.inactiveColor = widget.inactiveColor;
            return GestureDetector(
              onTap: () => _onItemSelected(index),
              child: _ItemNavWidget(
                item: item,
                iconSize: widget.iconSize,
                isSelected: index == _currentIndex,
                backgroundColor: Colors.amber,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
