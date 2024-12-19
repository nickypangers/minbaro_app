import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:minbaro_app/states/app_state.dart';
import 'package:provider/provider.dart';

class ScaffoldWithNavigationShell extends StatefulWidget {
  const ScaffoldWithNavigationShell({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  @override
  State<ScaffoldWithNavigationShell> createState() =>
      _ScaffoldWithNavigationShellState();
}

class _ScaffoldWithNavigationShellState
    extends State<ScaffoldWithNavigationShell> {
  void _goBranch(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, appState, _) => Stack(
        children: [
          Scaffold(
            body: widget.navigationShell,
            bottomNavigationBar: _CustomBottomNavBar(
              onTap: _goBranch,
              selectedIndex: widget.navigationShell.currentIndex,
            ),
          ),
          if (appState.shouldBlurApp)
            AnimatedContainer(
              duration: const Duration(milliseconds: 5),
              decoration: BoxDecoration(
                color: const Color.fromARGB(135, 88, 88, 88).withAlpha(128),
              ),
              child: Opacity(opacity: 1),
            ),
        ],
      ),
    );
  }
}

class _NavItem extends Equatable {
  const _NavItem({required this.iconData});

  final IconData iconData;

  @override
  List<Object?> get props => [iconData];
}

class _CustomBottomNavBar extends StatelessWidget {
  _CustomBottomNavBar({
    required this.onTap,
    this.selectedIndex = 0,
  });

  final int selectedIndex;
  final void Function(int) onTap;

  final _navChildren = <_NavItem>[
    _NavItem(iconData: CupertinoIcons.home),
    _NavItem(iconData: CupertinoIcons.search),
    _NavItem(iconData: CupertinoIcons.bell),
    _NavItem(iconData: CupertinoIcons.person),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.grey,
            width: 0,
          ),
        ),
      ),
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _navChildren.mapIndexed((index, item) {
          return _buildNavItem(
            context,
            icon: Icon(
              item.iconData,
              color: Colors.grey,
            ),
            activeIcon: Icon(
              item.iconData,
              // color: Theme.of(context).colorScheme.primary,
              color: Colors.white,
            ),
            selected: index == selectedIndex,
            onTap: () => onTap(index % 2),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context, {
    required Widget icon,
    Widget? activeIcon,
    void Function()? onTap,
    bool selected = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (selected) activeIcon ?? icon else icon,
          if (selected)
            Container(
              margin: const EdgeInsets.only(top: 16 / 3),
              height: 4,
              width: 4,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                // color: Theme.of(context).indicatorColor,
                color: Colors.white,
              ),
            )
          else
            Container(
              margin: EdgeInsets.only(top: 16 / 3),
              height: 4,
            ),
        ],
      ),
    );
  }
}
