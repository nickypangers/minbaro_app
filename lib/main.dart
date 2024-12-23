import 'package:flutter/material.dart';
import 'package:minbaro_app/repositories/posts_repository/posts_repository.dart';
import 'package:minbaro_app/router/app_router.dart';
import 'package:minbaro_app/states/app_state.dart';
import 'package:minbaro_app/theme/app_theme.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final postsRepository = PostsRepository();

  runApp(
    MinBaroApp(
      postsRepository: postsRepository,
    ),
  );
}

class MinBaroApp extends StatelessWidget {
  const MinBaroApp({required PostsRepository postsRepository, super.key})
      : _postsRepository = postsRepository;

  final PostsRepository _postsRepository;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppState(),
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: ThemeMode.dark,
        builder: (context, child) => MultiProvider(
          providers: [
            Provider<PostsRepository>.value(value: _postsRepository),
          ],
          child: child,
        ),
      ),
    );
  }
}
