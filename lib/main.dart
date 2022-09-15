import 'package:flutter/material.dart';
import 'package:untis_book_rent_app/app.dart';
import 'package:untis_book_rent_app/injection.dart';

void main() async {
  /*AbstractApiService<User, int, CreateUserDto, UpdateUserDto, CreateUserDto>
      userApi = UserService(endpoint: 'users');
  var users = await userApi.getAllEntities();
  debugPrint(users.toString());*/

  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
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
    Application(),
  );
}
