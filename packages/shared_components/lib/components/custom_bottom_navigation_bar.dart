import 'package:domain/entities/custom_bottom_navigation_bar_contract.dart';
import 'package:flutter/material.dart';

part 'custom_item_nav.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final Color? backgroundColor;
  final Color activeColor;
  final Color inactiveColor;
  final List<CustomItemNavWidget> items;
  final double containerHeight;

  const CustomBottomNavigationBar({
    Key? key,
    this.backgroundColor,
    this.activeColor = Colors.blue,
    this.inactiveColor = Colors.grey,
    this.containerHeight = 56,
    required this.items,
  })  : assert(items.length >= 2 && items.length <= 5),
        super(key: key);

  static CustomBottomNavigationBar fromDto(CustomBottomNavigationBarContract contract) {
    Color backgroundColor = null != contract.backgroundColor ? Color(contract.backgroundColor!) : Colors.white;

    List<CustomItemNavWidget> items = contract.items.map((item) => 
      CustomItemNavWidget(icon: Icon(IconData(item.icon, fontFamily: 'MaterialIcons')), color: Color(item.color))
    ).toList();

    return CustomBottomNavigationBar(
      backgroundColor: backgroundColor,
      activeColor: Color(contract.activeColor),
      inactiveColor: Color(contract.inactiveColor),
      containerHeight: contract.containerHeight,
      items: items,
    );
  }

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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: widget.items.map((item) {
            var index = widget.items.indexOf(item);

            return GestureDetector(
              onTap: () => _onItemSelected(index),
              child: CustomItemNavWidget(
                icon: item.icon,
                color: (index == _currentIndex) ? widget.activeColor : widget.inactiveColor,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
