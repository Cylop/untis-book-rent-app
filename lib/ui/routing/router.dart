import 'package:auto_route/auto_route.dart';
import 'package:untis_book_rent_app/app.dart';
import 'package:untis_book_rent_app/ui/pages/login/view/login_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(
      path: '',
      page: AppView,
      initial: true,
    ),
    AutoRoute(
      path: '/login',
      page: LoginPage,
    ),
  ],
)
class $AppRouter {}
