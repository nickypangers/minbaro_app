import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minbaro_app/components/more_modal_sheet.dart';
import 'package:minbaro_app/models/models.dart';
import 'package:minbaro_app/pages/post_detail/bloc/post_detail_bloc.dart';
import 'package:minbaro_app/pages/post_detail/views/post_detail_view.dart';
import 'package:minbaro_app/repositories/posts_repository/posts_repository.dart';

class PostDetailPage extends StatelessWidget {
  const PostDetailPage({required this.post, super.key});

  final Post post;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostDetailBloc(
          post: post, postsRepository: context.read<PostsRepository>())
        ..add(PostDetailInit()),
      child: Scaffold(
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
        body: PostDetailView(),
      ),
    );
  }
}
