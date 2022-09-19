// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:auto_route/empty_router_widgets.dart' as _i4;
import 'package:flutter/material.dart' as _i7;

import '../../app.dart' as _i1;
import '../pages/home/home.dart' as _i3;
import '../pages/home/pages/book_page/book_page.dart' as _i5;
import '../pages/login/view/login_page.dart' as _i2;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    AppView.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.AppView());
    },
    LoginRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.LoginPage());
    },
    HomeRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.HomePage());
    },
    BooksRouter.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.EmptyRouterPage());
    },
    BooksRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.BooksPage());
    }
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(AppView.name, path: '/'),
        _i6.RouteConfig(LoginRoute.name, path: '/'),
        _i6.RouteConfig(HomeRoute.name, path: '/', children: [
          _i6.RouteConfig(BooksRouter.name,
              path: 'books',
              parent: HomeRoute.name,
              children: [
                _i6.RouteConfig(BooksRoute.name,
                    path: '', parent: BooksRouter.name),
                _i6.RouteConfig('*#redirect',
                    path: '*',
                    parent: BooksRouter.name,
                    redirectTo: '',
                    fullMatch: true)
              ])
        ])
      ];
}

/// generated route for
/// [_i1.AppView]
class AppView extends _i6.PageRouteInfo<void> {
  const AppView() : super(AppView.name, path: '/');

  static const String name = 'AppView';
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i6.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute({List<_i6.PageRouteInfo>? children})
      : super(HomeRoute.name, path: '/', initialChildren: children);

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i4.EmptyRouterPage]
class BooksRouter extends _i6.PageRouteInfo<void> {
  const BooksRouter({List<_i6.PageRouteInfo>? children})
      : super(BooksRouter.name, path: 'books', initialChildren: children);

  static const String name = 'BooksRouter';
}

/// generated route for
/// [_i5.BooksPage]
class BooksRoute extends _i6.PageRouteInfo<void> {
  const BooksRoute() : super(BooksRoute.name, path: '');

  static const String name = 'BooksRoute';
}
