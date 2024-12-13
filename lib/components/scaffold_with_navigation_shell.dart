import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
    return Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: _CustomBottomNavBar(
        onTap: _goBranch,
        selectedIndex: widget.navigationShell.currentIndex,
      ),
    );
  }
}

class _CustomBottomNavBar extends StatelessWidget {
  const _CustomBottomNavBar({
    required this.onTap,
    // ignore: unused_element
    this.selectedIndex = 0,
  });

  final int selectedIndex;
  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.grey,
            width: 1,
          ),
        ),
      ),
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(
            icon: const Icon(Icons.home),
            activeIcon: const Icon(Icons.home, color: Colors.cyan),
            selected: selectedIndex == 0,
            onTap: () => onTap(0),
          ),
          _buildNavItem(
            icon: const Icon(Icons.search),
            activeIcon: const Icon(Icons.search, color: Colors.cyan),
            selected: selectedIndex == 1,
            onTap: () => onTap(1),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
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
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.cyan,
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
