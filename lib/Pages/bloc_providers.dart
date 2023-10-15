import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_2/Pages/sign_in/bloc/signin_blocs.dart';
import 'package:flutter_bloc_2/Pages/sign_up/bloc/signup_blocs.dart';
import 'package:flutter_bloc_2/Pages/welcome/bloc/welcome_blocs.dart';
//import 'package:flutter_bloc_2/app_blocs.dart';

class AppBlocProviders {
  static get allBlocProviders => [
        BlocProvider(
          lazy: false,
          create: (context) => WelcomeBloc(),
        ),
        // BlocProvider(
        //   lazy: false,
        //   create: (context) => AppBlocs(),
        // ),
        BlocProvider(create: (context) => SignInBloc()),
        BlocProvider(
          create: (context) => SignUpBlocs(),
        )
      ];
}
