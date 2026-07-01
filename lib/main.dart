import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';

import 'core/app/portfolio_app.dart';
import 'features/portfolio/controllers/portfolio_controller.dart';
import 'features/home/controllers/theme_provider.dart';
import 'features/home/controllers/navigation_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
  setPathUrlStrategy();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PortfolioController()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
      ],
      child: const PortfolioApp(),
    ),
  );
}
