import 'package:injectable/injectable.dart';
import 'package:untis_book_rent_app/api/dto/book/book.dart';
import 'package:untis_book_rent_app/api/rest/services/auth_service.dart';
import 'package:untis_book_rent_app/api/rest/services/book_rent_service.dart';
import 'package:untis_book_rent_app/api/rest/services/book_service.dart';
import 'package:untis_book_rent_app/api/rest/services/class_service.dart';
import 'package:untis_book_rent_app/api/rest/services/user_service.dart';
import 'package:untis_book_rent_app/ui/pages/home/widgets/animated_infinite_scrolling_list/bloc/bloc.dart';

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
  ClassService get classService => BasicClassService(endpoint: 'classes');

  @Named('animatedBookListBloc')
  AnimatedInfiniteScrollingBloc<Book> get animatedBookListBloc =>
      AnimatedInfiniteScrollingBloc(bookService);

  @Named('animatedClassListBloc')
  AnimatedInfiniteScrollingBloc<Book> get animatedClassListBloc =>
      AnimatedInfiniteScrollingBloc(bookService);
}
