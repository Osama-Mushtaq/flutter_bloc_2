class AppStates {
  int counter;
  AppStates({required this.counter});
}

class InitAppStates extends AppStates {
  InitAppStates() : super(counter: -2);
}
