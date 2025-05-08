import 'package:findet/domain/models/user_model.dart';
import 'package:findet/generated/l10n.dart';
import 'package:findet/helpers/global_data.dart';
import 'package:findet/ui/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

/// Эвент блока темизации
abstract class AuthEvent {}

/// Эвент изменения стейта авторизации
class AuthChanged extends AuthEvent {
  final bool isAuthenticated;

  AuthChanged({required this.isAuthenticated});
}

/// Эвент навигации на нужный экран после получения стейта авторизации
class AuthStartNavigate extends AuthEvent {}

/// Эвент разлогина
class AuthLogout extends AuthEvent {
  final BuildContext context;

  AuthLogout({required this.context});
}

class AuthTryLogin extends AuthEvent {
  final String login;
  final String password;
  final BuildContext context;

  AuthTryLogin({
    required this.login,
    required this.password,
    required this.context,
  });
}

/// Стейт блока авторизации
abstract class AuthState {}

/// Стейт авторизованного юзера
class AuthCompletedState extends AuthState {
  final UserModel user;

  AuthCompletedState({required this.user});
}

/// Стейт неавторизованного юзера
class AuthNotCompletedState extends AuthState {}

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthNotCompletedState()) {
    on<AuthChanged>(_authChanged);
    on<AuthTryLogin>(_tryLoginHandler);
    on<AuthStartNavigate>(_startNavigateHandler);
    on<AuthLogout>(_authLogout);
  }

  void _authChanged(AuthChanged event, Emitter<AuthState> emit) {
    if (event.isAuthenticated) {
      final user = authService.getAuthUser();
      if (user != null) {
        emit(AuthCompletedState(user: user));
      } else {
        emit(AuthNotCompletedState());
      }
    } else {
      emit(AuthNotCompletedState());
    }
  }

  void _authLogout(AuthLogout event, Emitter<AuthState> emit) {
    authService.logout();

    emit(AuthNotCompletedState());

    event.context.go(Routes.welcome);
  }

  Future<void> _startNavigateHandler(AuthStartNavigate event, Emitter<AuthState> emit) async {
    await authService.init();
    add(AuthChanged(isAuthenticated: authService.isAuthenticated()));
  }

  Future<void> _tryLoginHandler(AuthTryLogin event, Emitter<AuthState> emit) async {
    final authUser = await datasource.getAuthorizedUser(login: event.login, password: event.password);
    final context = event.context;
    if (context.mounted) {
      if (authUser != null) {
        // Токеном является id пользователя
        authService.saveToken(token: authUser.id);
        authService.saveUser(user: authUser);

        toastService.showDefaultToast(message: S.of(context).welcome(authUser.firstName), context: context);

        emit(AuthCompletedState(user: authUser));

        context.go(Routes.home);
      } else {
        toastService.showErrorToast(
          message: S.of(context).uncorrect_login_or_password_error,
          context: context,
        );
      }
    }
  }
}
