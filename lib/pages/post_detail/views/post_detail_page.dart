import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:minbaro_app/components/more_modal_sheet.dart';
import 'package:minbaro_app/models/post.dart';
import 'package:minbaro_app/pages/post_detail/views/post_detail_view.dart';

class PostDetailPage extends StatelessWidget {
  const PostDetailPage({required this.post, super.key});

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post'),
        actions: [
          CupertinoButton(
            child: Icon(
              CupertinoIcons.ellipsis,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            onPressed: () {
              showMoreModalSheet(context);
            },
          ),
        ],
      ),
      body: PostDetailView(post: post),
    );
  }
}
