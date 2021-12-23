import 'package:domain/entities/custom_nav_bar_contract.dart';
import 'package:flutter/material.dart';

part 'custom_item_nav.dart';

class CustomNavBar extends StatefulWidget {
  final Color? backgroundColor;
  final Color activeColor;
  final Color inactiveColor;
  final List<CustomItemNavWidget> items;
  final double containerHeight;

  const CustomNavBar({
    Key? key,
    this.backgroundColor,
    this.activeColor = Colors.blue,
    this.inactiveColor = Colors.grey,
    this.containerHeight = 56,
    required this.items,
  })  : assert(items.length >= 2 && items.length <= 5),
        super(key: key);

  static CustomNavBar fromDto(CustomNavBarContract contract) {
    Color backgroundColor = null != contract.backgroundColor
        ? Color(contract.backgroundColor!)
        : Colors.white;

    List<CustomItemNavWidget> items = contract.items
        .map((item) => CustomItemNavWidget(
            icon: Icon(IconData(item.icon, fontFamily: 'MaterialIcons')),
            color: Color(item.color)))
        .toList();

    return CustomNavBar(
      backgroundColor: backgroundColor,
      activeColor: Color(contract.activeColor),
      inactiveColor: Color(contract.inactiveColor),
      containerHeight: contract.containerHeight,
      items: items,
    );
  }

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  int _currentIndex = 0;

  _onItemSelected(index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   decoration: BoxDecoration(
    //     color: widget.backgroundColor,
    //     boxShadow: [
    //       BoxShadow(
    //         color: const Color(0xFFCAD3DD).withOpacity(0.3),
    //         spreadRadius: 0,
    //         blurRadius: 25,
    //         offset: const Offset(0, -10), // changes position of shadow
    //       ),
    //     ],
    //     borderRadius: const BorderRadius.only(
    //       topLeft: Radius.circular(32),
    //       topRight: Radius.circular(32),
    //     ),
    //   ),
    //   width: double.infinity,
    //   height: widget.containerHeight,
    //   padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 50),
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //     children: widget.items.map((item) {
    //       var index = widget.items.indexOf(item);

    //       return GestureDetector(
    //         onTap: () => _onItemSelected(index),
    //         child: CustomItemNavWidget(
    //           icon: item.icon,
    //           color: (index == _currentIndex)
    //               ? widget.activeColor
    //               : widget.inactiveColor,
    //         ),
    //       );
    //     }).toList(),
    //   ),
    // );
    return Container(
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
          )),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: BottomNavigationBar(backgroundColor: Colors.white, items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Shop',
          ),
        ]),
      ),
    );
  }
}
