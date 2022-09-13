import 'package:flutter/material.dart';
import 'package:untis_book_rent_app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Routes.createRoutes();
  runApp(
      /*MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: AuthService.instance(),
        ),
      ],
      child: AdvancedToDoApp(),
    ),*/
      const Application());
}
