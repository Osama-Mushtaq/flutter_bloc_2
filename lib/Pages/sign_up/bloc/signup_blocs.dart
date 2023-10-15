import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_2/Pages/sign_up/bloc/signup_events.dart';
import 'package:flutter_bloc_2/Pages/sign_up/bloc/signup_states.dart';

class SignUpBlocs extends Bloc<SignUpEvent, SignUpStates> {
  SignUpBlocs() : super(const SignUpStates()) {
    on<UserNameEvent>(_userNameEvent);
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
    on<ConfirmPasswordEvent>(_confirmPasswordEvent);
  }

  void _userNameEvent(UserNameEvent event, Emitter<SignUpStates> emit) {
    print("${event.userName}");
    emit(state.copyWith(username: event.userName));
  }

  void _emailEvent(EmailEvent event, Emitter<SignUpStates> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _passwordEvent(PasswordEvent event, Emitter<SignUpStates> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _confirmPasswordEvent(
      ConfirmPasswordEvent event, Emitter<SignUpStates> emit) {
    emit(state.copyWith(confirmPassword: event.confirmPassword));
  }
}
