// ignore_for_file: empty_catches

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_2/common/widgets/flutter_toast.dart';

import 'bloc/signin_blocs.dart';

class SignInController {
  final BuildContext context;
  const SignInController({required this.context});

  Future<void> handleSignIn(String type) async {
    try {
      if (type == "email") {
        final state = context.read<SignInBloc>().state;
        String emailaddress = state.email;
        String password = state.password;
        if (emailaddress.isEmpty) {
          toastInfo(msg: "You need to fill email address");
          return;
        }
        if (password.isEmpty) {
          toastInfo(msg: "You need to fill password");
          return;
        }
        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailaddress, password: password);
          if (credential.user == null) {
            toastInfo(msg: "You don't exist");
            return;
          }
          if (credential.user!.emailVerified) {
            toastInfo(msg: "You need to verify your email address");
            return;
          }

          var user = credential.user;
          if (user != null) {
          } else {
            toastInfo(msg: "You are not a user of this app");
            return;
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            toastInfo(msg: "No user found for that email.");
          } else if (e.code == 'wrong-password') {
            toastInfo(msg: "Wrong password provided for that user.");
          } else if (e.code == 'invalid-email') {
            toastInfo(msg: "Invalid email");
          }
        }
      }
    } catch (e) {}
  }
}
