import 'package:equatable/equatable.dart';
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
  }

  final PostsRepository _postsRepository;

  Future<void> _onInit(
      PostDetailInit event, Emitter<PostDetailState> emit) async {
    final comments = await _postsRepository.getPostComments(state.post.id);

    emit(PostDetailStateWithComments(post: state.post, comments: comments));
  }
}
