import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untis_book_rent_app/ui/pages/splash/splash.dart';
import 'package:untis_book_rent_app/ui/routing/router.gr.dart';
import 'package:untis_book_rent_app/ui/state/auth_bloc/bloc.dart';
import 'package:untis_book_rent_app/ui/state/auth_bloc/state.dart';
import 'package:untis_book_rent_app/ui/state/repositories/auth_repository.dart';

import 'injection.dart';

class Application extends StatelessWidget {
  Application({super.key});

  final _navigatorKey = GlobalKey<NavigatorState>();

  final _appRouter = locator<AppRouter>();
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<AuthenticationBloc>(),
      child: BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (BuildContext context, state) {
          debugPrint('State listener ${state.status.toString()}');
          switch (state.status) {
            case AuthenticationStatus.authenticated:
              _appRouter.replaceAll([const HomeRoute()]);
              break;
            case AuthenticationStatus.unauthenticated:
              _appRouter.replaceAll([const LoginRoute()]);
              break;
            case AuthenticationStatus.unknown:
            case AuthenticationStatus.loggingIn:
            case AuthenticationStatus.loggingOut:
              break;
          }
        },
        child: MaterialApp.router(
          title: 'Untis Book Rent',
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark(useMaterial3: true),
          routeInformationParser: _appRouter.defaultRouteParser(),
          routerDelegate: _appRouter.delegate(),
        ),
      ),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  @override
  Widget build(BuildContext context) {
    return const SplashPage();
  }
}
