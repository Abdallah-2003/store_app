import 'package:flutter/material.dart';
import 'package:schooler_chat/core/routing/routes.dart';
import 'package:schooler_chat/features/home/presentation/views/home_view.dart';
import 'package:schooler_chat/features/login/views/login_view.dart';

class AppRouter {


  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeView:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case Routes.loginView:
        return MaterialPageRoute(builder: (_) => LoginView());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}