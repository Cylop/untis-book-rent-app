// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'api/rest/services/auth_service.dart' as _i3;
import 'api/rest/services/book_inventory_service.dart' as _i4;
import 'api/rest/services/book_rent_service.dart' as _i5;
import 'api/rest/services/book_service.dart' as _i6;
import 'api/rest/services/class_service.dart' as _i7;
import 'api/rest/services/user_service.dart' as _i10;
import 'ui/services/app.module.dart' as _i12;
import 'ui/state/auth_bloc/bloc.dart' as _i11;
import 'ui/state/repositories/auth_repository.dart' as _i8;
import 'ui/state/repositories/user_repository.dart'
    as _i9; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final appModule = _$AppModule();
  gh.factory<_i3.AuthService>(() => appModule.authService);
  gh.factory<_i4.BookInventoryService>(() => appModule.bookInventoryService);
  gh.factory<_i5.BookRentService>(() => appModule.bookRentService);
  gh.factory<_i6.BookService>(() => appModule.bookService);
  gh.factory<_i7.ClassService>(() => appModule.classService);
  gh.factory<_i8.IAuthenticationRepository>(
      () => _i8.AuthenticationRepository());
  gh.factory<_i9.IUserRepository>(() => _i9.UserRepository());
  gh.factory<_i10.UserService>(() => appModule.userService);
  gh.factory<_i11.AuthenticationBloc>(() => _i11.AuthenticationBloc(
      authenticationRepository: get<_i8.IAuthenticationRepository>(),
      userRepository: get<_i9.IUserRepository>()));
  return get;
}

class _$AppModule extends _i12.AppModule {}
