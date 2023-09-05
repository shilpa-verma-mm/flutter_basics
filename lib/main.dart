import 'package:flutter/material.dart';
import 'package:flutter_basics/models/cartmodel.dart';
import 'package:flutter_basics/pages/catalog_screen.dart';
import 'package:flutter_basics/pages/home_screen.dart';
import 'package:flutter_basics/pages/landing_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_basics/pages/login_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CartModel(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (
        BuildContext context,
        GoRouterState state,
      ) {
        return const LandingScreen();
      },
      routes: [
        GoRoute(
          path: "login",
          builder: (context, state) => const LoginScreen(),
        )
      ],
    ),
    GoRoute(
      name: "home",
      path: '/home:id/:name',
      builder: (
        BuildContext context,
        GoRouterState state,
      ) {
        return HomeScreen(
          id: state.pathParameters["id"]!,
          name: state.pathParameters["name"]!,
          email: state.uri.queryParameters["email"],
          age: state.uri.queryParameters["age"],
          place: state.uri.queryParameters["place"],
        );
      },
    ),
    GoRoute(
      name: "catalog",
      path: '/catalog',
      builder: (
        BuildContext context,
        GoRouterState state,
      ) {
        return const CatalogScreen();
      },
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return const MaterialApp(
    //   home: LandingScreen(),
    // );
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}
