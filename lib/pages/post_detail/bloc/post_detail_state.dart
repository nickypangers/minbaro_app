part of 'post_detail_bloc.dart';

enum PostDetailStatus { initial, loading, success, failure }

abstract class PostDetailState extends Equatable {
  const PostDetailState({
    required this.post,
    required this.comments,
    required this.status,
  });

  final Post post;

  final List<Comment> comments;

  final PostDetailStatus status;

  Map<int, List<Comment>> get groupedComments {
    final map = <int, List<Comment>>{};

    for (final comment in comments) {
      final key = comment.parentId ?? comment.id;

      if (!map.containsKey(key)) {
        map[key] = [];
      } else {
        map[key]!.add(comment);
      }
    }

    return map;
  }

  @override
  List<Object?> get props => [
        post,
        comments,
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
