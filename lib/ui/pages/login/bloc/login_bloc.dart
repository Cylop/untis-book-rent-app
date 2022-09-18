import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:untis_book_rent_app/injection.dart';
import 'package:untis_book_rent_app/ui/pages/login/models/models.dart';
import 'package:untis_book_rent_app/ui/state/auth_bloc/bloc.dart';
import 'package:untis_book_rent_app/ui/state/auth_bloc/event.dart';
import 'package:untis_book_rent_app/ui/state/auth_bloc/state.dart';
import 'package:untis_book_rent_app/ui/state/repositories/auth_repository.dart';

import 'package:formz/formz.dart';

part 'login_event.dart';
part 'login_state.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final IAuthenticationRepository _authenticationRepository;

  LoginBloc(this._authenticationRepository) : super(const LoginState()) {
    on<LoginEmailChanged>(_onEmailChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginSubmitted>(_onSubmitted);
  }

  void _onEmailChanged(
    LoginEmailChanged event,
    Emitter<LoginState> emit,
  ) {
    final email = Email.dirty(event.email);
    emit(
      state.copyWith(
        email: email,
        status: Formz.validate([state.password, email]),
      ),
    );
  }

  void _onPasswordChanged(
    LoginPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    final password = Password.dirty(event.password);
    emit(
      state.copyWith(
        password: password,
        status: Formz.validate([password, state.email]),
      ),
    );
  }

  Future<void> _onSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      try {
        /*var authBloc = locator<AuthenticationBloc>();
        authBloc.add(AuthenticationLoginRequest(
            email: state.email.value, password: state.password.value));*/
        await _authenticationRepository.logIn(
          email: state.email.value,
          password: state.password.value,
        );
        emit(state.copyWith(status: FormzStatus.submissionSuccess));
      } catch (error) {
        debugPrint("Error for submission");
        debugPrint(error.toString());
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    }
  }
}
