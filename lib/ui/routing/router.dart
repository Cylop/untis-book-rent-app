import 'package:auto_route/auto_route.dart';
import 'package:untis_book_rent_app/ui/pages/homepage/screens/login_screen.dart';
import 'package:untis_book_rent_app/ui/pages/homepage/screens/register_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(
      page: LoginPage,
      initial: true,
    ),
    AutoRoute(page: RegisterPage),
  ],
)
class $AppRouter {}
