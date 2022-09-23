// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'api/dto/book/book.dart' as _i4;
import 'api/dto/class/class.dart' as _i5;
import 'api/rest/services/auth_service.dart' as _i7;
import 'api/rest/services/book_rent_service.dart' as _i8;
import 'api/rest/services/book_service.dart' as _i9;
import 'api/rest/services/class_service.dart' as _i10;
import 'api/rest/services/user_service.dart' as _i13;
import 'ui/pages/home/pages/book_page/modals/create_book/bloc/bloc.dart'
    as _i11;
import 'ui/pages/home/widgets/animated_infinite_scrolling_list/bloc/bloc.dart'
    as _i3;
import 'ui/pages/login/bloc/login_bloc.dart' as _i16;
import 'ui/routing/router.gr.dart' as _i6;
import 'ui/services/app.module.dart' as _i17;
import 'ui/state/auth_bloc/bloc.dart' as _i15;
import 'ui/state/repositories/auth_repository.dart' as _i14;
import 'ui/state/repositories/user_repository.dart'
    as _i12; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i3.AnimatedInfiniteScrollingBloc<_i5.SchoolClass>>(
    () => appModule.animatedClassListBloc,
    instanceName: 'animatedClassListBloc',
  );
  gh.factory<_i6.AppRouter>(() => appModule.appRouter);
  gh.factory<_i7.AuthService>(() => appModule.authService);
  gh.factory<_i8.BookRentService>(() => appModule.bookRentService);
  gh.factory<_i9.BookService>(() => appModule.bookService);
  gh.factory<_i10.ClassService>(() => appModule.classService);
  gh.factory<_i11.CreateBookBloc>(
      () => _i11.CreateBookBloc(get<_i9.BookService>()));
  gh.singleton<_i12.IUserRepository>(_i12.UserRepository());
  gh.factory<_i13.UserService>(() => appModule.userService);
  gh.singleton<_i14.AuthRepository>(
      _i14.AuthenticationRepository(get<_i7.AuthService>()));
  gh.singleton<_i15.AuthenticationBloc>(
      _i15.AuthenticationBloc(authRepository: get<_i14.AuthRepository>()));
  gh.factory<_i16.LoginBloc>(() => _i16.LoginBloc(
        get<_i15.AuthenticationBloc>(),
        get<_i14.AuthRepository>(),
      ));
  return get;
}

class _$AppModule extends _i17.AppModule {}
