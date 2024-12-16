import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:minbaro_app/components/post_action_button.dart';

class PostActionButtonRow extends StatefulWidget {
  const PostActionButtonRow({super.key});

  @override
  State<PostActionButtonRow> createState() => _PostActionButtonRowState();
}

class _PostActionButtonRowState extends State<PostActionButtonRow> {
  bool _isFavourited = false;
  bool _isCommented = false;
  bool _isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 32,
      children: [
        PostActionButton(
          iconData: CupertinoIcons.heart,
          selectedIconData: CupertinoIcons.heart_fill,
          label: '1.2k',
          selected: _isFavourited,
          selectedColor: Colors.red,
          onPressed: () {
            setState(() {
              _isFavourited = !_isFavourited;
            });
          },
        ),
        PostActionButton(
          iconData: CupertinoIcons.bubble_middle_bottom,
          selectedIconData: CupertinoIcons.bubble_middle_bottom_fill,
          label: '80',
          selected: _isCommented,
          onPressed: () {
            setState(() {
              _isCommented = !_isCommented;
            });
          },
        ),
        PostActionButton(
          iconData: CupertinoIcons.bookmark,
          selectedIconData: CupertinoIcons.bookmark_fill,
          selected: _isBookmarked,
          onPressed: () {
            setState(() {
              _isBookmarked = !_isBookmarked;
            });
          },
        ),
      ],
    );
  }
}
