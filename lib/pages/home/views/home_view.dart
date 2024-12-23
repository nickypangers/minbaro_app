import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:minbaro_app/components/post_tile.dart';
import 'package:minbaro_app/components/root_app_bar.dart';
import 'package:minbaro_app/pages/home/bloc/home_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _count = 50;

  final _tabs = [
    'For You',
    'Following',
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxScrolled) => [
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: RootAppBar(
                isSliver: true,
                title: Text('Home'),
                actions: [
                  CupertinoButton(
                    child: Icon(
                      CupertinoIcons.eyeglasses,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    onPressed: () {
                      context.push('/watchlist');
                    },
                  ),
                ],
                forceElevated: innerBoxScrolled,
                bottom: TabBar(
                  tabs: _tabs.map((e) => Tab(text: e)).toList(),
                ),
              ),
            ),
          ],
          body: TabBarView(
            children: _tabs
                .map(
                  (e) => Builder(
                    builder: (context) {
                      return CustomScrollView(
                        key: PageStorageKey<String>(e),
                        semanticChildCount: _count,
                        physics: const BouncingScrollPhysics(),
                        slivers: [
                          BlocBuilder<HomeBloc, HomeState>(
                            builder: (context, state) =>
                                CupertinoSliverRefreshControl(
                              onRefresh: () async {
                                final bloc = context.read<HomeBloc>();
                                bloc.add(HomePostOverviewsRequested());
                                bloc.stream.firstWhere((state) =>
                                    state.status != HomeStatus.loading);
                              },
                            ),
                          ),
                          BlocBuilder<HomeBloc, HomeState>(
                            builder: (context, state) {
                              return SliverList.separated(
                                itemCount: state.posts.length,
                                separatorBuilder: (context, idx) => Divider(
                                  height: 0,
                                  color:
                                      Theme.of(context).colorScheme.onSurface,
                                ),
                                itemBuilder: (context, idx) {
                                  final post = state.posts[idx];

                                  return GestureDetector(
                                    onTap: () => context.go('/post/$idx',
                                        extra: post.toJson()),
                                    child: PostTile(
                                      post: post,
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      );
                    },
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
