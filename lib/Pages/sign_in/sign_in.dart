//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_2/Pages/sign_in/widgets/sign_in_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: myAppBar1(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                thirdPartyLogin(context),
                Center(child: reusabletext("Or use your email to login")),
                Container(
                  padding: EdgeInsets.only(left: 25.w, right: 25.w),
                  margin: EdgeInsets.only(top: 56.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      reusabletext("Email"),
                      SizedBox(height: 2.h),
                      signInFields("user", "Your Email address", "email"),
                      reusabletext("Password"),
                      SizedBox(height: 2.h),
                      signInFields("lock", "Your password", "password")
                    ],
                  ),
                ),
                forgotPassword(),
                signInsignUpButton("Login", "login"),
                signInsignUpButton("Sign Up", "signUp"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
