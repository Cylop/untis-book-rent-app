import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:untis_book_rent_app/app.dart';
import 'package:untis_book_rent_app/ui/pages/home/home.dart';
import 'package:untis_book_rent_app/ui/pages/home/pages/book_page/view/book_detail_page/book_detail_page.dart';
import 'package:untis_book_rent_app/ui/pages/home/pages/book_page/view/book_page.dart';
import 'package:untis_book_rent_app/ui/pages/login/view/login_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(
      path: '/',
      page: AppView,
      initial: true,
    ),
    AutoRoute(
      path: '/',
      page: LoginPage,
    ),
    AutoRoute(
      path: '/',
      page: HomePage,
      children: [
        AutoRoute(
          path: 'books',
          name: "BooksRouter",
          page: EmptyRouterPage,
          children: [
            AutoRoute(path: '', page: BooksPage),
            AutoRoute(path: ':isbn', page: BookDetailPage),
            //AutoRoute(path: ':bookId', page: BookDetailsPage),
            RedirectRoute(path: '*', redirectTo: ''),
          ],
        )
      ],
    ),
  ],
)
class $AppRouter {}
