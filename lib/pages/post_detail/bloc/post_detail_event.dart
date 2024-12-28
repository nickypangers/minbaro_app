part of 'post_detail_bloc.dart';

abstract class PostDetailEvent extends Equatable {
  const PostDetailEvent();

  @override
  List<Object?> get props => [];
}

class PostDetailInit extends PostDetailEvent {}

class PostDetailReplyToCommentSelected extends PostDetailEvent {
  const PostDetailReplyToCommentSelected({this.comment});

  final Comment? comment;
}

class PostDetailCancelReply extends PostDetailEvent {}

class PostDetailAddCommentRequested extends PostDetailEvent {
  const PostDetailAddCommentRequested({required this.postId, this.parentId});

  final int postId;
  final int? parentId;

  @override
  List<Object?> get props => [postId, parentId];
}
