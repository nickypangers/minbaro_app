import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minbaro_app/models/models.dart';
import 'package:minbaro_app/repositories/posts_repository/posts_repository.dart';

part 'post_detail_event.dart';
part 'post_detail_state.dart';

class PostDetailBloc extends Bloc<PostDetailEvent, PostDetailState> {
  PostDetailBloc({
    required PostsRepository postsRepository,
    required Post post,
  })  : _postsRepository = postsRepository,
        super(PostDetailStateInitial(post: post)) {
    on<PostDetailInit>(_onInit);
    on<PostDetailAddCommentRequested>(_onAddCommentRequested);
    on<PostDetailReplyToCommentSelected>(_onReplyToCommentRequested);
    on<PostDetailCancelReply>(_onCancelReply);
  }

  final PostsRepository _postsRepository;

  Future<void> _onInit(
      PostDetailInit event, Emitter<PostDetailState> emit) async {
    final comments = await _postsRepository.getPostComments(state.post.id);

    comments.sort((a, b) => b.createdAt.compareTo(a.createdAt));

    emit(PostDetailStateWithComments(post: state.post, comments: comments));
  }

  Future<void> _onAddCommentRequested(PostDetailAddCommentRequested event,
      Emitter<PostDetailState> emit) async {
    try {
      final comment = await _postsRepository.addCommentToPost({
        'postId': event.postId,
        'body': 'Testing some words',
        'authorId': Random().nextInt(9) + 1,
        'parentId': event.parentId,
      });

      final comments = [...state.comments, comment];

      comments.sort((a, b) => b.createdAt.compareTo(a.createdAt));

      emit(PostDetailStateWithComments(post: state.post, comments: comments));
    } catch (e) {
      debugPrint(e.toString());

      emit(PostDetailStateFailure(post: state.post, comments: state.comments));
    }
  }

  void _onReplyToCommentRequested(
      PostDetailReplyToCommentSelected event, Emitter<PostDetailState> emit) {
    emit(state.copyWith(replyingTo: event.comment));
  }

  void _onCancelReply(
      PostDetailCancelReply event, Emitter<PostDetailState> emit) {
    add(PostDetailReplyToCommentSelected(comment: null));
  }
}
