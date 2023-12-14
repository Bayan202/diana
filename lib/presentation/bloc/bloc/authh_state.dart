abstract class AuthState {}

class AuthInitial extends AuthState {}

class Authenticated extends AuthState {
  final String userId;

  Authenticated(this.userId);
}

class AuthFailure extends AuthState {
  final String message;

  AuthFailure(this.message);
}

class RegistrationSuccess extends AuthState {}

class RegistrationFailure extends AuthState {
  final String message;

  RegistrationFailure(this.message);
}