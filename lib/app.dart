import 'package:flutter/material.dart';
import 'package:untis_book_rent_app/pages/homepage/homepage.dart';
import 'package:untis_book_rent_app/pages/homepage/screens/login_screen.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Untis Book Rent',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(useMaterial3: true),
        /*onGenerateRoute: Routes.sailor.generator(),
      navigatorKey: Routes.sailor.navigatorKey,

      theme: theme.myTheme,
      home: FutureBuilder(
        future: _userDatabaseService.getOrCreateUser(),
        builder: (BuildContext context, AsyncSnapshot<UserModel> snapshot) {
          if(snapshot.hasData && !snapshot.hasError) {
            return HomeScreen();
          }
          return LoadingSpinner();
        },
      ),*/
        home: const LoginPage(
            title: 'Login Ui') //HomePage(title: 'Flutter Demo Home Page'),
        );
  }
}
