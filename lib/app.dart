import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untis_book_rent_app/ui/pages/splash/splash.dart';
import 'package:untis_book_rent_app/ui/routing/router.gr.dart';
import 'package:untis_book_rent_app/ui/state/auth_bloc/bloc.dart';
import 'package:untis_book_rent_app/ui/state/auth_bloc/event.dart';
import 'package:untis_book_rent_app/ui/state/auth_bloc/state.dart';

import 'injection.dart';

class Application extends StatelessWidget {
  Application({super.key});

  final _appRouter = locator<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<AuthenticationBloc>()..add(AppLoaded()),
      child: BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (BuildContext context, state) {
          debugPrint('State listener ${state.status.toString()}');
          switch (state.status) {
            case AuthState.authenticated:
              _appRouter.replaceAll([const HomeRoute()]);
              break;
            case AuthState.unauthenticated:
            case AuthState.failure:
              _appRouter.replaceAll([const LoginRoute()]);
              break;
            case AuthState.unknown:
            case AuthState.initial:
            case AuthState.loading:
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
