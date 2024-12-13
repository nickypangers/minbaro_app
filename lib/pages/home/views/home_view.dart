import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:minbaro_app/components/post_tile.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

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
              sliver: SliverAppBar(
                leading: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(),
                ),
                title: Text(
                  'Home',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                centerTitle: true,
                actions: [
                  IconButton(
                    icon: Icon(CupertinoIcons.eyeglasses),
                    onPressed: () {},
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
                .map((e) => Builder(builder: (context) {
                      return CustomScrollView(
                        key: PageStorageKey<String>(e),
                        semanticChildCount: _count,
                        physics: const BouncingScrollPhysics(),
                        slivers: [
                          CupertinoSliverRefreshControl(
                            onRefresh: () async => Future.delayed(
                              const Duration(seconds: 1),
                            ).then(
                              (_) => print('refreshed'),
                            ),
                          ),
                          SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (context, idx) {
                                if (idx.isEven) {
                                  return GestureDetector(
                                    onTap: () => context.go('/post/$idx'),
                                    child: PostTile(),
                                  );
                                }
                                return Divider(
                                  height: 0,
                                  color: Colors.grey,
                                );
                              },
                              semanticIndexCallback: (widget, localIndex) =>
                                  localIndex.isEven ? localIndex ~/ 2 : null,
                              childCount: _count,
                            ),
                          ),
                        ],
                      );
                    }))
                .toList(),
          ),
        ),
      ),
    );
  }
}
