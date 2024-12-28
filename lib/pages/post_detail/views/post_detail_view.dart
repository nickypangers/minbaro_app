import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minbaro_app/components/comment_list.dart';
import 'package:minbaro_app/components/post_action_button_row.dart';
import 'package:minbaro_app/components/post_author_header.dart';
import 'package:minbaro_app/pages/post_detail/bloc/post_detail_bloc.dart';

class PostDetailView extends StatelessWidget {
  const PostDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.read<PostDetailBloc>().state;
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
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
                      BlocBuilder<PostDetailBloc, PostDetailState>(
                        buildWhen: (prev, curr) => prev.post != curr.post,
                        builder: (context, state) => PostActionButtonRow(
                          post: state.post,
                        ),
                      )
                    ],
                  ),
                  BlocBuilder<PostDetailBloc, PostDetailState>(
                    builder: (context, state) {
                      if (state.status == PostDetailStatus.loading) {
                        return const CircularProgressIndicator();
                      }

                      if (state.status == PostDetailStatus.failure) {
                        return const Text('Failed to load comments');
                      }

                      return Column(
                        spacing: 8,
                        children: state.rootComments
                            .map((comment) => CommentList(
                                  comment: comment,
                                  children: comment.children,
                                ))
                            .toList(),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          BlocBuilder<PostDetailBloc, PostDetailState>(
              builder: (context, state) {
            if (state.replyingTo == null) {
              return SizedBox.shrink();
            }
            return Container(
              padding: const EdgeInsets.all(8),
              color: Theme.of(context).colorScheme.surface,
              child: Row(
                children: [
                  Text.rich(
                    TextSpan(
                      text: 'Replying to',
                      style: Theme.of(context).textTheme.bodyMedium,
                      children: [
                        TextSpan(
                          text: ' ${state.replyingTo?.author.username}',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        )
                      ],
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      context
                          .read<PostDetailBloc>()
                          .add(PostDetailCancelReply());
                    },
                    icon: Icon(
                      CupertinoIcons.xmark_circle,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    iconSize: 18,
                  ),
                ],
              ),
            );
          }),
          Align(
            alignment: Alignment.bottomCenter,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Container(
                margin: const EdgeInsets.all(8),
                child: TextField(
                  maxLines: null,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintText: 'Add a comment',
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
