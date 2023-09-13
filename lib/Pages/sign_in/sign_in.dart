//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_2/Pages/common_widgets.dart';
import 'package:flutter_bloc_2/Pages/sign_in/bloc/signin_blocs.dart';
import 'package:flutter_bloc_2/Pages/sign_in/bloc/signin_events.dart';
import 'package:flutter_bloc_2/Pages/sign_in/bloc/signin_states.dart';
import 'package:flutter_bloc_2/Pages/sign_in/sign_in_controller.dart';
//import 'package:flutter_bloc_2/Pages/sign_in/widgets/sign_in_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: myAppBar1("Log in"),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    thirdPartyLogin(context),
                    Center(child: reusabletext("Or use your email to login")),
                    Container(
                      padding: EdgeInsets.only(left: 25.w, right: 25.w),
                      margin: EdgeInsets.only(top: 45.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          reusabletext("Email"),
                          SizedBox(height: 2.h),
                          signInFields("user", "Your Email address", "email",
                              (value) {
                            context
                                .read<SignInBloc>()
                                .add(EmailEvent(email: value));
                          }),
                          reusabletext("Password"),
                          SizedBox(height: 2.h),
                          signInFields("lock", "Your password", "password",
                              (value) {
                            context
                                .read<SignInBloc>()
                                .add(PasswordEvent(password: value));
                          })
                        ],
                      ),
                    ),
                    forgotPassword(),
                    signInsignUpButton("Login", "login", () {
                      SignInController(context: context).handleSignIn("email");
                    }),
                    signInsignUpButton("Sign Up", "signUp", () {
                      Navigator.of(context).pushNamed("signUp");
                    }),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
