abstract class AuthEvent {}

class EmailSignIn extends AuthEvent {
  final String email;
  final String password;

  EmailSignIn({required this.email, required this.password});
}

class RegisterUser extends AuthEvent {
  final String email;
  final String password;
  final String name;
  final String city;

  RegisterUser({required this.email, required this.password, required this.name, required this.city});
}

class SignOut extends AuthEvent {}