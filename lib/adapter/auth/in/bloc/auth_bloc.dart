import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_hexagonal/application/auth/port/in/load_user_use_case.dart';
import 'package:flutter_hexagonal/application/auth/port/in/login_use_case.dart';
import 'package:flutter_hexagonal/application/auth/port/in/logout_use_case.dart';
import 'package:flutter_hexagonal/domain/auth/user.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(
    this.loginUseCase,
    this.logoutUseCase,
    this.loadUserUseCase,
  ) : super(AuthInitial()) {
    on<LoginAuthEvent>((event, emit) async {
      final user = await loginUseCase.login(event.email, event.password);
      emit(AuthLoggedInState(user));
    });

    on<LogoutAuthEvent>((event, emit) async {
      await logoutUseCase.logout();
      emit(UnauthState());
    });

    on<OnUserChangedEvent>((event, emit) {
      if (event.user == null) {
        return emit(UnauthState());
      }
      return emit(AuthLoggedInState(event.user!));
    });

    subscribeToUserChanges();
  }

  final LoginUseCase loginUseCase;
  final LogoutUseCase logoutUseCase;
  final LoadUserUseCase loadUserUseCase;

  StreamSubscription? streamSubscription;

  Future subscribeToUserChanges() async {
    streamSubscription = loadUserUseCase.loadUser().listen(
          (user) => add(OnUserChangedEvent(user)),
        );
  }

  @override
  Future<void> close() {
    streamSubscription?.cancel();
    return super.close();
  }
}
