import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/data/repository/authrepository.dart';
import 'package:flutter_project/presentation/bloc/bloc/authh_event.dart';
import 'package:flutter_project/presentation/bloc/bloc/authh_state.dart';


class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(AuthInitial()) {
    on<EmailSignIn>(_onEmailSignIn);
    on<RegisterUser>(_onRegisterUser);
    on<SignOut>(_onSignOut);
  }

  void _onEmailSignIn(EmailSignIn event, Emitter<AuthState> emit) async {
    try {
      final user = await authRepository.signInWithEmailAndPassword(
        event.email, 
        event.password
      );
      if (user != null) {
        emit(Authenticated(user.uid));
      } else {
        emit(AuthFailure('Login failed'));
      }
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  void _onRegisterUser(RegisterUser event, Emitter<AuthState> emit) async {
    try {
      final user = await authRepository.createUserWithEmailAndPassword(
        event.email, 
        event.password
      );
      if (user != null) {
        await authRepository.saveUserData(event.name, event.city);
        emit(RegistrationSuccess());
      } else {
        emit(RegistrationFailure('Registration failed'));
      }
    } catch (e) {
      emit(RegistrationFailure(e.toString()));
    }
  }

  void _onSignOut(SignOut event, Emitter<AuthState> emit) async {
    await authRepository.signOut();
    emit(AuthInitial());
  }
}