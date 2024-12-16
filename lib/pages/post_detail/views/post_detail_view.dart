import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:minbaro_app/components/post_action_button_row.dart';
import 'package:minbaro_app/components/post_author_header.dart';
import 'package:minbaro_app/models/post.dart';

class PostDetailView extends StatelessWidget {
  const PostDetailView({required this.post, super.key});

  final Post post;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(8),
      child: Column(
        spacing: 8,
        children: [
          PostAuthorHeader(),
          Text(
            post.title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(post.body),
          Text(post.body),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PostActionButtonRow(),
              Row(
                spacing: 8,
                children: [
                  Icon(
                    CupertinoIcons.eye,
                    size: 18,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  Text(
                    '9.3k',
                    style: DefaultTextStyle.of(context).style.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
