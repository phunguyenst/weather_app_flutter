import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app_tutorial/router.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ProviderScope(
      child: MaterialApp.router(
        routerConfig: router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
