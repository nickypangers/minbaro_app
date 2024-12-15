import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:minbaro_app/components/more_modal_sheet.dart';
import 'package:minbaro_app/components/post_action_button.dart';
import 'package:minbaro_app/models/post.dart';

class PostTile extends StatefulWidget {
  const PostTile({
    required this.post,
    super.key,
  });

  final Post post;

  @override
  State<PostTile> createState() => _PostTileState();
}

class _PostTileState extends State<PostTile> {
  final _radius = 20.0;

  bool _isFavourited = false;
  bool _isCommented = false;
  bool _isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        spacing: 8,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: [
              CircleAvatar(
                radius: _radius,
                foregroundColor: Colors.lightBlue,
                foregroundImage: NetworkImage(
                  'https://picsum.photos/id/1/200/200',
                ),
              ),
              SizedBox(
                height: _radius * 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'nickypangers',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text.rich(
                      TextSpan(
                        text: 'topic',
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                        children: [
                          TextSpan(
                            text: ' • 3m',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurface),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              CupertinoButton(
                padding: const EdgeInsets.all(0),
                sizeStyle: CupertinoButtonSize.small,
                onPressed: () {
                  showMoreModalSheet(context);
                },
                child: Icon(
                  CupertinoIcons.ellipsis,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ],
          ),
          _buildIndentedRow(
            child: Flexible(
              child: Text(
                widget.post.title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
          _buildIndentedRow(
            child: Flexible(
              child: Text.rich(
                TextSpan(
                  text: widget.post.body,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
              ),
            ),
          ),
          _buildIndentedRow(
            child: Row(
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
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIndentedRow({required Widget child}) {
    return Row(
      spacing: 8,
      children: [
        SizedBox(width: _radius * 2),
        child,
      ],
    );
  }
}
