import 'package:flutter/material.dart';
import 'package:minbaro_app/helpers/date_time_helper.dart';
import 'package:minbaro_app/models/models.dart';

class CommentTile extends StatelessWidget {
  const CommentTile({required this.comment, super.key});

  final Comment comment;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          Row(
            spacing: 8,
            children: [
              CircleAvatar(
                radius: 14,
              ),
              Text.rich(
                TextSpan(
                  text: comment.author.username,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontWeight: FontWeight.bold,
                      ),
                  children: [
                    TextSpan(
                      text:
                          ' • ${DateTimeHelper.formatAgoString(comment.createdAt)}',
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onSurface),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Text(
            ' (comment id: ${comment.id}, parent id: ${comment.parentId})',
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            decoration: BoxDecoration(
              color:
                  Theme.of(context).colorScheme.primary.withValues(alpha: 0.5),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4),
                topRight: Radius.circular(12),
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            child: Text(
              comment.body,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
