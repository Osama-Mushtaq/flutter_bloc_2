import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_2/Pages/application/application_pages.dart';
import 'package:flutter_bloc_2/Pages/bloc_providers.dart';
import 'package:flutter_bloc_2/Pages/sign_up/sign_up.dart';
import 'package:flutter_bloc_2/Pages/welcome/welcome.dart';
import 'package:flutter_bloc_2/app_blocs.dart';
import 'package:flutter_bloc_2/app_events.dart';
import 'package:flutter_bloc_2/app_states.dart';
import 'package:flutter_bloc_2/common/values/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Pages/sign_in/sign_in.dart';

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
      providers: AppBlocProviders.allBlocProviders,
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
          home: const ApplicationPage(),
          routes: {
            "myhompage": (context) =>
                const MyHomePage(title: 'Flutter Demo Home Page'),
            "signIn": (context) => const SignIn(),
            "signUp": (context) => const SignUp(),
          },
          //*const MyHomePage(title: 'Flutter Demo Home Page'),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
            child: BlocBuilder<AppBlocs, AppStates>(builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                "${BlocProvider.of<AppBlocs>(context).state.counter}",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          );
        })),
        floatingActionButton: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                heroTag: "herotagbtn1",
                onPressed: () =>
                    BlocProvider.of<AppBlocs>(context).add(IncrementEvent()),
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
              FloatingActionButton(
                heroTag: "herotagbtn2",
                onPressed: () =>
                    BlocProvider.of<AppBlocs>(context).add(DecrementEvent()),
                tooltip: 'Decrement',
                child: const Icon(Icons.remove),
              ),
            ],
          ),
        ));
  }
}
