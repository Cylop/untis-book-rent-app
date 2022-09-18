// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'api/rest/services/auth_service.dart' as _i4;
import 'api/rest/services/book_inventory_service.dart' as _i5;
import 'api/rest/services/book_rent_service.dart' as _i6;
import 'api/rest/services/book_service.dart' as _i7;
import 'api/rest/services/class_service.dart' as _i8;
import 'api/rest/services/user_service.dart' as _i12;
import 'ui/pages/login/bloc/login_bloc.dart' as _i11;
import 'ui/routing/router.gr.dart' as _i3;
import 'ui/services/app.module.dart' as _i14;
import 'ui/state/auth_bloc/bloc.dart' as _i13;
import 'ui/state/repositories/auth_repository.dart' as _i9;
import 'ui/state/repositories/user_repository.dart'
    as _i10; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final appModule = _$AppModule();
  gh.factory<_i3.AppRouter>(() => appModule.appRouter);
  gh.factory<_i4.AuthService>(() => appModule.authService);
  gh.factory<_i5.BookInventoryService>(() => appModule.bookInventoryService);
  gh.factory<_i6.BookRentService>(() => appModule.bookRentService);
  gh.factory<_i7.BookService>(() => appModule.bookService);
  gh.factory<_i8.ClassService>(() => appModule.classService);
  gh.singleton<_i9.IAuthenticationRepository>(
      _i9.AuthenticationRepository(get<_i4.AuthService>()));
  gh.singleton<_i10.IUserRepository>(_i10.UserRepository());
  gh.factory<_i11.LoginBloc>(
      () => _i11.LoginBloc(get<_i9.IAuthenticationRepository>()));
  gh.factory<_i12.UserService>(() => appModule.userService);
  gh.singleton<_i13.AuthenticationBloc>(_i13.AuthenticationBloc(
      authenticationRepository: get<_i9.IAuthenticationRepository>()));
  return get;
}

class _$AppModule extends _i14.AppModule {}
