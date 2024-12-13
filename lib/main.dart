import 'package:flutter/material.dart';
import 'package:minbaro_app/router/app_router.dart';

void main() {
  runApp(const MinBaroApp());
}

class MinBaroApp extends StatelessWidget {
  const MinBaroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
    );
  }
}
