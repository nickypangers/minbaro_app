import 'package:flutter/material.dart';
import 'package:minbaro_app/router/app_router.dart';
import 'package:minbaro_app/states/app_state.dart';
import 'package:minbaro_app/theme/app_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MinBaroApp());
}

class MinBaroApp extends StatelessWidget {
  const MinBaroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppState(),
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: ThemeMode.dark,
      ),
    );
  }
}
