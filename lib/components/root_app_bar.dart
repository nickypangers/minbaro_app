import 'package:flutter/material.dart';

class RootAppBar extends StatelessWidget {
  const RootAppBar({
    required this.title,
    this.actions,
    this.bottom,
    this.isSliver = false,
    this.forceElevated = false,
    super.key,
  });

  final Widget title;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  final bool isSliver;
  final bool? forceElevated;

  @override
  Widget build(BuildContext context) {
    if (isSliver) {
      return SliverAppBar(
        leading: _buildAvatar(context),
        title: title,
        centerTitle: true,
        actions: actions,
        forceElevated: forceElevated!,
        bottom: bottom,
      );
    } else {
      return AppBar(
        leading: _buildAvatar(context),
        title: title,
        centerTitle: true,
        actions: actions,
      );
    }
  }

  Widget _buildAvatar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(),
    );
  }
}
