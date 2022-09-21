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
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:auto_route/empty_router_widgets.dart' as _i4;
import 'package:flutter/material.dart' as _i8;

import '../../api/dto/book/book.dart' as _i9;
import '../../app.dart' as _i1;
import '../pages/home/home.dart' as _i3;
import '../pages/home/pages/book_page/view/book_detail_page/book_detail_page.dart'
    as _i6;
import '../pages/home/pages/book_page/view/book_page.dart' as _i5;
import '../pages/login/view/login_page.dart' as _i2;

class AppRouter extends _i7.RootStackRouter {
  AppRouter([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    AppView.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.AppView(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.LoginPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.HomePage(),
      );
    },
    BooksRouter.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.EmptyRouterPage(),
      );
    },
    BooksRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.BooksPage(),
      );
    },
    BookDetailRoute.name: (routeData) {
      final args = routeData.argsAs<BookDetailRouteArgs>();
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i6.BookDetailPage(
          args.book,
          key: args.key,
        ),
      );
    },
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(
          AppView.name,
          path: '/',
        ),
        _i7.RouteConfig(
          LoginRoute.name,
          path: '/',
        ),
        _i7.RouteConfig(
          HomeRoute.name,
          path: '/',
          children: [
            _i7.RouteConfig(
              BooksRouter.name,
              path: 'books',
              parent: HomeRoute.name,
              children: [
                _i7.RouteConfig(
                  BooksRoute.name,
                  path: '',
                  parent: BooksRouter.name,
                ),
                _i7.RouteConfig(
                  BookDetailRoute.name,
                  path: ':isbn',
                  parent: BooksRouter.name,
                ),
                _i7.RouteConfig(
                  '*#redirect',
                  path: '*',
                  parent: BooksRouter.name,
                  redirectTo: '',
                  fullMatch: true,
                ),
              ],
            )
          ],
        ),
      ];
}

/// generated route for
/// [_i1.AppView]
class AppView extends _i7.PageRouteInfo<void> {
  const AppView()
      : super(
          AppView.name,
          path: '/',
        );

  static const String name = 'AppView';
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i7.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute({List<_i7.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i4.EmptyRouterPage]
class BooksRouter extends _i7.PageRouteInfo<void> {
  const BooksRouter({List<_i7.PageRouteInfo>? children})
      : super(
          BooksRouter.name,
          path: 'books',
          initialChildren: children,
        );

  static const String name = 'BooksRouter';
}

/// generated route for
/// [_i5.BooksPage]
class BooksRoute extends _i7.PageRouteInfo<void> {
  const BooksRoute()
      : super(
          BooksRoute.name,
          path: '',
        );

  static const String name = 'BooksRoute';
}

/// generated route for
/// [_i6.BookDetailPage]
class BookDetailRoute extends _i7.PageRouteInfo<BookDetailRouteArgs> {
  BookDetailRoute({
    required _i9.Book book,
    _i8.Key? key,
  }) : super(
          BookDetailRoute.name,
          path: ':isbn',
          args: BookDetailRouteArgs(
            book: book,
            key: key,
          ),
        );

  static const String name = 'BookDetailRoute';
}

class BookDetailRouteArgs {
  const BookDetailRouteArgs({
    required this.book,
    this.key,
  });

  final _i9.Book book;

  final _i8.Key? key;

  @override
  String toString() {
    return 'BookDetailRouteArgs{book: $book, key: $key}';
  }
}
