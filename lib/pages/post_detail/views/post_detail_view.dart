import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minbaro_app/components/comment_tile.dart';
import 'package:minbaro_app/components/post_action_button_row.dart';
import 'package:minbaro_app/components/post_author_header.dart';
import 'package:minbaro_app/pages/post_detail/bloc/post_detail_bloc.dart';

class PostDetailView extends StatelessWidget {
  const PostDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.read<PostDetailBloc>().state;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(8),
      child: Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PostAuthorHeader(post: state.post),
          Text(
            state.post.title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(state.post.body),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PostActionButtonRow(post: state.post),
            ],
          ),
          BlocBuilder<PostDetailBloc, PostDetailState>(
            builder: (context, state) {
              // return Text(state.groupedComments.toString());
              print(state.groupedComments);
              if (state.status == PostDetailStatus.loading) {
                return const CircularProgressIndicator();
              }

              if (state.status == PostDetailStatus.failure) {
                return const Text('Failed to load comments');
              }

              return Column(
                spacing: 8,
                children: state.comments
                    .map((comment) => CommentTile(comment: comment))
                    .toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}
