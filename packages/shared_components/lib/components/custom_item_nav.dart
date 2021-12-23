part of 'custom_nav_bar.dart';

class CustomItemNavWidget extends StatelessWidget {
  final Widget icon;
  final Color color;

  const CustomItemNavWidget({
    Key? key,
    required this.icon,
    required this.color,
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
              size: 24,
              color: color,
            ),
            child: icon,
          ),
        ],
      ),
    );
  }
}
