import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:untis_book_rent_app/api/rest/services/user_service.dart';
import 'package:untis_book_rent_app/app.dart';
import 'package:untis_book_rent_app/injection.dart';

void main() async {
  /*AbstractApiService<User, int, CreateUserDto, UpdateUserDto, CreateUserDto>
      userApi = UserService(endpoint: 'users');
  var users = await userApi.getAllEntities();
  debugPrint(users.toString());*/

  var service = GetIt.I.get<UserService>();

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
    const Application(),
  );
}
