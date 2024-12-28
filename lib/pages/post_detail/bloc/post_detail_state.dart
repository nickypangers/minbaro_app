part of 'post_detail_bloc.dart';

enum PostDetailStatus { initial, loading, success, failure }

class PostDetailState extends Equatable {
  const PostDetailState({
    required this.post,
    required this.comments,
    required this.status,
    this.replyingTo,
  });

  final Post post;

  final List<Comment> comments;

  final PostDetailStatus status;

  final Comment? replyingTo;

  List<Comment> get rootComments {
    final Map<int?, List<Comment>> groupedComments = {};
    for (final comment in comments) {
      if (comment.parentId != null) {
        if (!groupedComments.containsKey(comment.parentId)) {
          groupedComments[comment.parentId] = [];
        }
        groupedComments[comment.parentId]!.add(comment);
      }
    }

    for (final key in groupedComments.keys) {
      if (key != null) {
        final comment = comments.firstWhere((comment) => comment.id == key);
        comment.addChildren(groupedComments[key] ?? []);
      }
    }

    return comments.where((comment) => comment.parentId == null).toList();
  }

  PostDetailState copyWith({
    Post? post,
    List<Comment>? comments,
    PostDetailStatus? status,
    Comment? replyingTo,
  }) {
    return PostDetailState(
      post: post ?? this.post,
      comments: comments ?? this.comments,
      status: status ?? this.status,
      replyingTo: replyingTo,
    );
  }

  @override
  List<Object?> get props => [
        post,
        comments,
        status,
        replyingTo,
      ];
}

class PostDetailStateInitial extends PostDetailState {
  const PostDetailStateInitial({
    required super.post,
    super.comments = const [],
    super.status = PostDetailStatus.initial,
  });
}

class PostDetailStateWithComments extends PostDetailState {
  const PostDetailStateWithComments({
    required super.post,
    required super.comments,
    super.status = PostDetailStatus.success,
  });
}

class PostDetailStateLoading extends PostDetailState {
  const PostDetailStateLoading({
    required super.post,
    required super.comments,
    super.status = PostDetailStatus.loading,
  });
}

class PostDetailStateFailure extends PostDetailState {
  const PostDetailStateFailure({
    required super.post,
    required super.comments,
    super.status = PostDetailStatus.failure,
  });
}
