import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_2/Pages/application/bloc/app.states.dart';
import 'package:flutter_bloc_2/Pages/application/bloc/app_events.dart';

class AppBlocs extends Bloc<AppEvent, AppStates> {
  AppBlocs() : super(const AppStates()) {
    on<TriggerAppEvent>((event, emit) {
      emit(AppStates(index: event.index));
    });
  }
}
