import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minbaro_app/pages/home/bloc/home_bloc.dart';
import 'package:minbaro_app/pages/home/views/home_view.dart';
import 'package:minbaro_app/repositories/posts_repository/posts_repository.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) =>
          HomeBloc(postsRepository: context.read<PostsRepository>())
            ..add(HomeInit()),
      child: HomeView(),
    );
  }
}
