import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  final Duration _animationDuration = const Duration(milliseconds: 300);
  bool _searchOpened = false;
  double _searchWidth = 40.0;

  void toggleSearch(BuildContext context) {
    if (_searchOpened) {
      _closeSearchBar();
    } else {
      _openSearchBar();
    }
  }

  void _openSearchBar() {
    Future.delayed(
      _animationDuration,
      () => setState(() {
        _searchWidth = MediaQuery.of(context).size.width;
      }),
    );
    setState(() {
      _searchOpened = !_searchOpened;
    });
  }

  void _closeSearchBar() {
    setState(() {
      _searchWidth = 40;
    });
    Future.delayed(
      _animationDuration,
      () => setState(() {
        _searchOpened = !_searchOpened;
      }),
    );
  }

  Widget chooseWidget(BuildContext context) {
    if (_searchOpened) {
      return TweenAnimationBuilder(
        tween: Tween<double>(begin: 40, end: _searchWidth),
        duration: _animationDuration,
        child: InkWell(
          child: const Icon(
            Icons.search,
            color: Colors.white,
          ),
          onTap: () => toggleSearch(context),
        ),
        builder: (_, double width, child) {
          return Align(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: const Color(0x98B3B3B3),
              ),
              child: child,
              width: width,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 8),
            ),
            alignment: Alignment.centerRight,
          );
        },
      );
    } else {
      return Row(
        children: [
          ClipOval(
            child: Image.asset(
              'assets/images/perfil.jpeg',
              height: 40,
              width: 40,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Text(
              'Home',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          InkWell(
            child: const Icon(
              Icons.search,
              color: Colors.white,
            ),
            onTap: () => toggleSearch(context),
          ),
          const SizedBox(
            width: 8,
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      width: MediaQuery.of(context).size.width,
      height: widget.preferredSize.height,
      color: Colors.transparent,
      child: Row(
        children: [
          Expanded(
            child: AnimatedSwitcher(
              duration: _animationDuration,
              child: chooseWidget(context),
              switchInCurve: Curves.easeIn,
              switchOutCurve: Curves.easeIn,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          const Icon(
            Icons.menu_rounded,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
