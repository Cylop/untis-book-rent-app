// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'api/dto/book/book.dart' as _i4;
import 'api/rest/services/auth_service.dart' as _i6;
import 'api/rest/services/book_rent_service.dart' as _i7;
import 'api/rest/services/book_service.dart' as _i8;
import 'api/rest/services/class_service.dart' as _i9;
import 'api/rest/services/user_service.dart' as _i12;
import 'ui/pages/home/pages/book_page/modals/create_book/bloc/bloc.dart'
    as _i10;
import 'ui/pages/home/widgets/animated_infinite_scrolling_list/bloc/bloc.dart'
    as _i3;
import 'ui/pages/login/bloc/login_bloc.dart' as _i15;
import 'ui/routing/router.gr.dart' as _i5;
import 'ui/services/app.module.dart' as _i16;
import 'ui/state/auth_bloc/bloc.dart' as _i14;
import 'ui/state/repositories/auth_repository.dart' as _i13;
import 'ui/state/repositories/user_repository.dart'
    as _i11; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i3.AnimatedInfiniteScrollingBloc<_i4.Book>>(
    () => appModule.animatedBookListBloc,
    instanceName: 'animatedBookListBloc',
  );
  gh.factory<_i3.AnimatedInfiniteScrollingBloc<_i4.Book>>(
    () => appModule.animatedClassListBloc,
    instanceName: 'animatedClassListBloc',
  );
  gh.factory<_i5.AppRouter>(() => appModule.appRouter);
  gh.factory<_i6.AuthService>(() => appModule.authService);
  gh.factory<_i7.BookRentService>(() => appModule.bookRentService);
  gh.factory<_i8.BookService>(() => appModule.bookService);
  gh.factory<_i9.ClassService>(() => appModule.classService);
  gh.factory<_i10.CreateBookBloc>(
      () => _i10.CreateBookBloc(get<_i8.BookService>()));
  gh.singleton<_i11.IUserRepository>(_i11.UserRepository());
  gh.factory<_i12.UserService>(() => appModule.userService);
  gh.singleton<_i13.AuthRepository>(
      _i13.AuthenticationRepository(get<_i6.AuthService>()));
  gh.singleton<_i14.AuthenticationBloc>(
      _i14.AuthenticationBloc(authRepository: get<_i13.AuthRepository>()));
  gh.factory<_i15.LoginBloc>(() => _i15.LoginBloc(
        get<_i14.AuthenticationBloc>(),
        get<_i13.AuthRepository>(),
      ));
  return get;
}

class _$AppModule extends _i16.AppModule {}
