import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:minbaro_app/components/more_modal_sheet.dart';
import 'package:minbaro_app/components/post_action_button_row.dart';
import 'package:minbaro_app/components/post_author_header.dart';
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
              PostAuthorHeader(),
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
            child: PostActionButtonRow(),
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
