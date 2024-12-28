import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minbaro_app/helpers/date_time_helper.dart';
import 'package:minbaro_app/models/models.dart';
import 'package:minbaro_app/pages/post_detail/bloc/post_detail_bloc.dart';

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
              Expanded(
                child: Text.rich(
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
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(
                                color: Theme.of(context).colorScheme.onSurface),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Flexible(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  decoration: BoxDecoration(
                    color: Theme.of(context)
                        .colorScheme
                        .primary
                        .withValues(alpha: 0.5),
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
              ),
              IconButton(
                padding: EdgeInsets.zero,
                icon: Icon(
                  CupertinoIcons.reply,
                  size: 14,
                ),
                onPressed: () {
                  context.read<PostDetailBloc>().add(
                      // PostDetailAddCommentRequested(
                      //   postId: comment.postId,
                      //   parentId: comment.id,
                      // ),
                      PostDetailReplyToCommentSelected(comment: comment));
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
