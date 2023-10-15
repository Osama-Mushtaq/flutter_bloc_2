import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_2/common/routes/routes.dart';
import 'package:flutter_bloc_2/common/values/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [...AppPages.allBlocProviders(context)],
      child: ScreenUtilInit(
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              iconTheme: IconThemeData(color: AppColors.primaryText),
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            // colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
            useMaterial3: true,
          ),
          //home: const ApplicationPage(),
          onGenerateRoute: AppPages.GenerateRouteSettings,
          // routes: {
          //   "myhompage": (context) =>
          //       const MyHomePage(title: 'Flutter Demo Home Page'),
          //   "signIn": (context) => const SignIn(),
          //   "signUp": (context) => const SignUp(),
          // },
          //*const MyHomePage(title: 'Flutter Demo Home Page'),
        ),
      ),
    );
  }
}
