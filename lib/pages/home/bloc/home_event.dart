part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class HomeInit extends HomeEvent {}

class HomePostOverviewsRequested extends HomeEvent {}
