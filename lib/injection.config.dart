// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'api/rest/services/auth_service.dart' as _i4;
import 'api/rest/services/book_rent_service.dart' as _i5;
import 'api/rest/services/book_service.dart' as _i6;
import 'api/rest/services/class_service.dart' as _i7;
import 'api/rest/services/user_service.dart' as _i10;
import 'ui/pages/home/pages/book_page/books_bloc/bloc.dart' as _i13;
import 'ui/pages/home/pages/book_page/modals/create_book/bloc/bloc.dart' as _i8;
import 'ui/pages/login/bloc/login_bloc.dart' as _i14;
import 'ui/routing/router.gr.dart' as _i3;
import 'ui/services/app.module.dart' as _i15;
import 'ui/state/auth_bloc/bloc.dart' as _i12;
import 'ui/state/repositories/auth_repository.dart' as _i11;
import 'ui/state/repositories/user_repository.dart'
    as _i9; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final appModule = _$AppModule();
  gh.factory<_i3.AppRouter>(() => appModule.appRouter);
  gh.factory<_i4.AuthService>(() => appModule.authService);
  gh.factory<_i5.BookRentService>(() => appModule.bookRentService);
  gh.factory<_i6.BookService>(() => appModule.bookService);
  gh.factory<_i7.ClassService>(() => appModule.classService);
  gh.factory<_i8.CreateBookBloc>(
      () => _i8.CreateBookBloc(get<_i6.BookService>()));
  gh.singleton<_i9.IUserRepository>(_i9.UserRepository());
  gh.factory<_i10.UserService>(() => appModule.userService);
  gh.singleton<_i11.AuthRepository>(
      _i11.AuthenticationRepository(get<_i4.AuthService>()));
  gh.singleton<_i12.AuthenticationBloc>(
      _i12.AuthenticationBloc(authRepository: get<_i11.AuthRepository>()));
  gh.factory<_i13.BookBloc>(() => _i13.BookBloc(get<_i6.BookService>()));
  gh.factory<_i14.LoginBloc>(() => _i14.LoginBloc(
        get<_i12.AuthenticationBloc>(),
        get<_i11.AuthRepository>(),
      ));
  return get;
}

class _$AppModule extends _i15.AppModule {}
