import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:minbaro_app/models/models.dart';
import 'package:minbaro_app/repositories/posts_repository/posts_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required PostsRepository postsRepository})
      : _postsRepository = postsRepository,
        super(HomeState.initial()) {
    on<HomeInit>(_onInit);
    on<HomePostOverviewsRequested>(_onGetPostOverviews);
  }

  final PostsRepository _postsRepository;

  Future<void> _onInit(HomeInit event, Emitter<HomeState> emit) async {
    try {
      final postOverviews = await _postsRepository.getPostOverviews();

      emit(state.copyWith(
        posts: postOverviews,
        status: HomeStatus.success,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: HomeStatus.failure,
      ));
    }
  }

  Future<void> _onGetPostOverviews(
      HomePostOverviewsRequested event, Emitter<HomeState> emit) async {
    emit(state.copyWith(
      status: HomeStatus.loading,
    ));

    try {
      final postOverviews = await _postsRepository.getPostOverviews();

      emit(state.copyWith(
        posts: postOverviews,
        status: HomeStatus.success,
      ));
    } catch (e) {
      debugPrint('$e');
      emit(state.copyWith(
        status: HomeStatus.failure,
      ));
    }
  }
}
