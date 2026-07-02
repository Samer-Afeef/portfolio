import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/home/views/home_screen.dart';

class AppRoutes {
  static const String home = '/';

  static final GoRouter router = GoRouter(
    initialLocation: home,
    routes: [
      GoRoute(
        path: home,
        builder: (context, state) => const HomeScreen(),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(child: Text('Page not found: ${state.error}')),
    ),
  );
}
