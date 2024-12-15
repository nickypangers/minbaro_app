import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:minbaro_app/components/post_tile.dart';
import 'package:minbaro_app/components/root_app_bar.dart';
import 'package:minbaro_app/models/post.dart';

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
                          CupertinoSliverRefreshControl(
                            onRefresh: () async => Future.delayed(
                              const Duration(seconds: 1),
                            ).then(
                              (_) => debugPrint('refreshed'),
                            ),
                          ),
                          SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (context, idx) {
                                if (idx.isEven) {
                                  final post = Post(
                                      id: idx,
                                      title:
                                          'Occaecat nisi occaecat aliquip ex aliquip do ad tempor do magna fugiat.',
                                      body:
                                          '''Fugiat exercitation incididunt enim nostrud veniam id nisi culpa commodo ad commodo. Non deserunt enim sit incididunt cupidatat dolor et deserunt commodo enim adipisicing dolore reprehenderit. Sunt exercitation mollit dolore irure magna enim veniam qui sit aliquip incididunt fugiat magna non. Magna non anim dolore cupidatat aliquip voluptate Lorem est.

Irure exercitation labore est consectetur dolore ad deserunt do ad quis non. Duis eiusmod eiusmod culpa minim incididunt laboris. Ullamco in nulla esse eu ea ad id voluptate magna laborum. Consequat non ad magna ut Lorem deserunt incididunt irure. Est ipsum proident duis consequat incididunt occaecat mollit minim commodo magna voluptate occaecat. Exercitation excepteur eiusmod qui ipsum. Adipisicing occaecat irure magna id occaecat proident dolore cupidatat do voluptate dolore cupidatat.

Id veniam cupidatat dolore proident in mollit ad tempor officia ea. Magna proident non nisi adipisicing culpa cupidatat nisi aliquip in quis. Incididunt ipsum culpa cillum voluptate enim velit voluptate velit labore enim. Culpa aute magna incididunt cillum sint dolore tempor. Minim do ipsum Lorem aliqua sunt commodo do incididunt deserunt consectetur.''');

                                  return GestureDetector(
                                    onTap: () =>
                                        context.go('/post/$idx', extra: post),
                                    child: PostTile(
                                      post: post,
                                    ),
                                  );
                                }
                                return Divider(
                                  height: 0,
                                  color:
                                      Theme.of(context).colorScheme.onSurface,
                                );
                              },
                              semanticIndexCallback: (widget, localIndex) =>
                                  localIndex.isEven ? localIndex ~/ 2 : null,
                              childCount: _count,
                            ),
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
