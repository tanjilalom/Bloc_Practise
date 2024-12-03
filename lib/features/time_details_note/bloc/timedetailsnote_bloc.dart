import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';

part 'timedetailsnote_event.dart';
part 'timedetailsnote_state.dart';

class TimedetailsnoteBloc extends Bloc<TimedetailsnoteEvent, TimedetailsnoteState> {
  TimedetailsnoteBloc() : super(TimedetailsnoteInitial()) {

    on<TaskAddEvent>((event, emit) async {
      var box = await Hive.openBox('tasksBox');

      final newTask = {
        'taskDesc': event.text,
        'taskdate': event.time,
      };

      await box.add(newTask);
    });

    on<TaskLoadedEvent>((event, emit) async {
      emit(TimedetailsnoteInitial());


      /*var box = await Hive.openBox('tasksBox');
      List<Map<String, dynamic>> taskList =
          box.values.map((e) => Map<String, dynamic>.from(e)).toList();*/


      var box = await Hive.openBox('tasksBox');
      List<Map<String, dynamic>> taskList = box.keys.map((key) {
        var value = box.get(key);
        return {
          'key': key,
          'taskDesc': value['taskDesc'],
          'taskdate': value['taskdate'],
        };
      }).toList();




      emit(HomeLoadedState(taskList: taskList));
    });

    on<TaskDeleteEvent>((event, emit) async {

      var box = await Hive.openBox('tasksBox');
      await box.delete(event.taskKey); // Delete task using its key
      add(TaskLoadedEvent()); // Reload tasks after deletion

    });
  }
}
