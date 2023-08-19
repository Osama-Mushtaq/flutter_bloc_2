import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_2/app_events.dart';
import 'package:flutter_bloc_2/app_states.dart';

class AppBlocs extends Bloc<AppEvents, AppStates> {
  AppBlocs() : super(InitAppStates()) {
    on<IncrementEvent>((event, emit) {
      emit(AppStates(counter: state.counter + 1));
    });

    on<DecrementEvent>((event, emit) {
      emit(AppStates(counter: state.counter - 1));
    });
  }
}
