import 'package:injectable/injectable.dart';
import 'package:untis_book_rent_app/api/rest/api_service.dart';
import 'package:untis_book_rent_app/api/rest/services/auth_service.dart';
import 'package:untis_book_rent_app/api/rest/services/book_inventory_service.dart';
import 'package:untis_book_rent_app/api/rest/services/book_rent_service.dart';
import 'package:untis_book_rent_app/api/rest/services/book_service.dart';
import 'package:untis_book_rent_app/api/rest/services/class_service.dart';
import 'package:untis_book_rent_app/api/rest/services/user_service.dart';

import '../routing/router.gr.dart';

@module
abstract class AppModule {
  @injectable
  AppRouter get appRouter => AppRouter();

  /*@preResolve
  Future<NotificationService> get notificationService async =>
      await NotificationService.init();*/

  @injectable
  AuthService get authService => BasicAuthService(endpoint: '');

  @injectable
  UserService get userService => BasicUserService(endpoint: 'users');

  @injectable
  BookService get bookService => BasicBookService(endpoint: 'books');

  @injectable
  BookRentService get bookRentService =>
      BasicBookRentService(endpoint: 'book-rents');

  @injectable
  BookInventoryService get bookInventoryService =>
      BasicBookInventoryService(endpoint: 'book-inventories');

  @injectable
  ClassService get classService => BasicClassService(endpoint: 'classes');
}
