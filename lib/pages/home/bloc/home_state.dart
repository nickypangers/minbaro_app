part of 'home_bloc.dart';

enum HomeStatus { initial, loading, success, failure }

class HomeState extends Equatable {
  const HomeState({
    required this.posts,
    required this.status,
  });

  factory HomeState.initial() => HomeState(
        posts: [],
        status: HomeStatus.loading,
      );

  final List<Post> posts;
  final HomeStatus status;

  HomeState copyWith({
    List<Post>? posts,
    HomeStatus? status,
  }) {
    posts?.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return HomeState(posts: posts ?? this.posts, status: status ?? this.status);
  }

  @override
  List<Object?> get props => [posts];
}
