import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:minbaro_app/components/scaffold_with_navigation_shell.dart';
import 'package:minbaro_app/models/models.dart';
import 'package:minbaro_app/pages/home/views/home_page.dart';
import 'package:minbaro_app/pages/post_detail/views/post_detail_page.dart';
import 'package:minbaro_app/pages/watchlist/views/watchlist_page.dart';

class AppRouter {
  static final GoRouter _router = GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            ScaffoldWithNavigationShell(
          navigationShell: navigationShell,
        ),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                  path: '/',
                  name: 'home',
                  builder: (context, state) => const HomePage(),
                  routes: [
                    GoRoute(
                      path: 'watchlist',
                      name: 'watchlist',
                      builder: (context, state) => WatchlistPage(),
                    ),
                    GoRoute(
                      path: 'post/:id',
                      name: 'post',
                      builder: (context, state) => PostDetailPage(
                          post: Post.fromJson(
                              state.extra! as Map<String, dynamic>)),
                    ),
                  ]),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/search',
                name: 'search',
                builder: (context, state) => Scaffold(
                  body: Center(
                    child: Text('Search'),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  );
  static get router => _router;
}
