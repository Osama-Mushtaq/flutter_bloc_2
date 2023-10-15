import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_2/Pages/application/application_pages.dart';
import 'package:flutter_bloc_2/Pages/application/bloc/app_blocs.dart';
import 'package:flutter_bloc_2/Pages/sign_in/bloc/signin_blocs.dart';
import 'package:flutter_bloc_2/Pages/sign_in/sign_in.dart';
import 'package:flutter_bloc_2/Pages/sign_up/bloc/signup_blocs.dart';
import 'package:flutter_bloc_2/Pages/sign_up/sign_up.dart';
import 'package:flutter_bloc_2/Pages/welcome/bloc/welcome_blocs.dart';
import 'package:flutter_bloc_2/Pages/welcome/welcome.dart';
import 'package:flutter_bloc_2/common/routes/names.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
          route: AppRoutes.INITIAL,
          page: const Welcome(),
          bloc: BlocProvider(create: (_) => WelcomeBloc())),
      PageEntity(
          route: AppRoutes.SIGNIN,
          page: const SignIn(),
          bloc: BlocProvider(create: (_) => SignInBloc())),
      PageEntity(
          route: AppRoutes.SIGNUP,
          page: const SignUp(),
          bloc: BlocProvider(create: (_) => SignUpBlocs())),
      PageEntity(
          route: AppRoutes.APPLICATION,
          page: const ApplicationPage(),
          bloc: BlocProvider(create: (_) => AppBlocs())),
    ];
  }

  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in routes()) {
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }

  static MaterialPageRoute GenerateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      var result = routes().where((element) => element.route == settings.name);
      if (result.isNotEmpty) {
        return MaterialPageRoute(builder: (_) => result.first.page);
      }
    }
    return MaterialPageRoute(builder: (_) => SignIn(), settings: settings);
  }
}

class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({required this.route, required this.page, this.bloc});
}
