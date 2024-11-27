import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'timedetailsnote_event.dart';
part 'timedetailsnote_state.dart';

class TimedetailsnoteBloc extends Bloc<TimedetailsnoteEvent, TimedetailsnoteState> {
  TimedetailsnoteBloc() : super(TimedetailsnoteInitial()) {
    on<TimedetailsnoteEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
