part of 'custom_bottom_navigation_bar.dart';

class _ItemNavWidget extends StatelessWidget {
  final double iconSize;
  final bool isSelected;
  final BottomNavBarItem item;
  final Color backgroundColor;

  const _ItemNavWidget({
    Key? key,
    required this.item,
    required this.isSelected,
    required this.backgroundColor,
    required this.iconSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          IconTheme(
            data: IconThemeData(
              size: iconSize,
              color: isSelected ? item.activeColor : item.inactiveColor,
            ),
            child: item.icon,
          ),
        ],
      ),
    );
  }
}

class BottomNavBarItem {
  BottomNavBarItem({
    required this.icon,
    required this.title,
    this.activeColor,
    this.textAlign,
    this.inactiveColor,
  });

  final Widget icon;
  final Widget title;
  late Color? activeColor;
  late Color? inactiveColor;
  TextAlign? textAlign;
}
