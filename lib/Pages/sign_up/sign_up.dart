import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_2/Pages/common_widgets.dart';
import 'package:flutter_bloc_2/Pages/sign_up/bloc/signup_blocs.dart';
import 'package:flutter_bloc_2/Pages/sign_up/bloc/signup_states.dart';
import 'package:flutter_bloc_2/Pages/sign_up/sign_up_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBlocs, SignUpStates>(builder: (context, state) {
      return Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: myAppBar1("Sign Up"),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Center(child: reusabletext("Sign Up for free")),
                  Container(
                    padding: EdgeInsets.only(left: 25.w, right: 25.w),
                    margin: EdgeInsets.only(top: 45.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        reusabletext("Username"),
                        SizedBox(height: 2.h),
                        signInFields("user", "Enter your username", "name",
                            (value) {
                          // context
                          //     .read<SignInBloc>()
                          //     .add(EmailEvent(email: value));
                        }),
                        reusabletext("Email"),
                        SizedBox(height: 2.h),
                        signInFields("user", "Your Email address", "email",
                            (value) {
                          // context
                          //     .read<SignInBloc>()
                          //     .add(EmailEvent(email: value));
                        }),
                        reusabletext("Password"),
                        SizedBox(height: 2.h),
                        signInFields("lock", "Your password", "password",
                            (value) {
                          // context
                          //     .read<SignInBloc>()
                          //     .add(PasswordEvent(password: value));
                        }),
                        reusabletext("Confirm Password"),
                        SizedBox(height: 2.h),
                        signInFields(
                            "lock", "Confirm your password", "password",
                            (value) {
                          // context
                          //     .read<SignInBloc>()
                          //     .add(PasswordEvent(password: value));
                        }),
                      ],
                    ),
                  ),
                  signInsignUpButton("Login", "signUp", () {
                    // Navigator.of(context).pushNamed("signUp");
                    SignUpController(context: context).handleEmail();
                  }),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
