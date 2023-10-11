import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_2/Pages/sign_up/bloc/signup_blocs.dart';
import 'package:flutter_bloc_2/common/widgets/flutter_toast.dart';

class SignUpController {
  final BuildContext context;
  const SignUpController({required this.context});

  Future<void> handleEmail() async {
    final state = context.read<SignUpBlocs>().state;
    String userName = state.username;
    String email = state.email;
    String password = state.password;
    String confirmPassword = state.confirmPassword;

    if (userName.isEmpty) {
      toastInfo(msg: "Username is empty");
      return;
    }
    if (email.isEmpty) {
      toastInfo(msg: "Email is empty");
      return;
    }
    if (password.isEmpty) {
      toastInfo(msg: "Password is empty");
      return;
    }
    if (confirmPassword.isEmpty) {
      toastInfo(msg: "Confirm Password is empty");
      return;
    }
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(userName);
        toastInfo(msg: "Email verification sent to your mail");
        Navigator.of(context).pop();
      }
    } on FirebaseException catch (e) {
      if (e.code == "weak-password") {
        toastInfo(msg: "Password is too weak");
      } else if (e.code == "email-already-in-use") {
        toastInfo(msg: "Email is already in use");
      } else if (e.code == "invalid-email") {
        toastInfo(msg: "Email is invalid");
      }
    }
  }
}
