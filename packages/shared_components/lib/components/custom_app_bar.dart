import 'package:domain/entities/custom_app_bar_contract.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:domain/entities/entities.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Image image;

  const CustomAppBar({Key? key, required this.image}) : super(key: key);

  static CustomAppBar fromDto(CustomAppBarContract contract) {
    return CustomAppBar(
      image: Image.network(
        contract.image,
        height: 40,
        width: 40,
        fit: BoxFit.cover,
      ),
    );
  }

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
            child: widget.image,
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
      // color: Colors.transparent,
      color: Colors.blue.shade300,
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
