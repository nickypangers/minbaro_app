import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:minbaro_app/components/scaffold_with_navigation_shell.dart';
import 'package:minbaro_app/pages/home/views/home_page.dart';

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
                  builder: (context, state) => const HomePage(),
                  routes: [
                    GoRoute(
                      path: 'post/:id',
                      builder: (context, state) => Scaffold(
                        appBar: AppBar(
                          title: Text('Post'),
                        ),
                        body: Center(
                          child: Text(state.pathParameters['id']!),
                        ),
                      ),
                    ),
                  ]),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/search',
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
