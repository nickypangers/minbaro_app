import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:minbaro_app/components/comment_tile.dart';
import 'package:minbaro_app/models/models.dart';

class CommentList extends StatelessWidget {
  const CommentList({
    required this.comment,
    this.children = const [],
    this.level = 0,
    super.key,
  });

  final Comment comment;
  final List<Comment> children;
  final int level;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommentTile(comment: comment),
        if (children.isNotEmpty)
          if (level > 4)
            Container(
              padding: const EdgeInsets.all(8),

              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(8),
              ),
              // color: Colors.blue,
              child: Center(
                child: Text(
                  '${children.length} more ${children.length == 1 ? 'comment' : 'comments'}',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            )
          else
            ...children.map(
              (c) => _buildIndentedRow(
                child: CommentList(
                  comment: c,
                  children: c.children,
                  level: level + 1,
                ),
              ),
            )
      ],
    );
  }

  Widget _buildIndentedRow({required Widget child}) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: Colors.grey,
            width: 0,
          ),
        ),
      ),
      child: Row(
        children: [
          SizedBox(width: 16),
          Expanded(child: child),
        ],
      ),
    );
  }
}
