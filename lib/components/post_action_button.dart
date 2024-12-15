import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostActionButton extends StatelessWidget {
  const PostActionButton(
      {required this.iconData,
      this.selectedIconData,
      this.label = '',
      this.selected = false,
      this.selectedColor = Colors.white,
      this.onPressed,
      super.key});

  final IconData iconData;
  final IconData? selectedIconData;
  final String label;
  final bool selected;
  final Color selectedColor;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: const EdgeInsets.all(0),
      sizeStyle: CupertinoButtonSize.small,
      onPressed: onPressed,
      child: Row(
        spacing: 8,
        children: [
          Icon(
            selected ? selectedIconData ?? iconData : iconData,
            color: selected
                ? selectedColor
                : Theme.of(context).colorScheme.onSurface,
          ),
          if (label.isEmpty)
            const SizedBox.shrink()
          else
            Text(
              label,
              style: DefaultTextStyle.of(context).style.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
        ],
      ),
    );
  }
}
