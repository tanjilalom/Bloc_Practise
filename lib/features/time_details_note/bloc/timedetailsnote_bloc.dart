import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'timedetailsnote_event.dart';

part 'timedetailsnote_state.dart';

class TimedetailsnoteBloc extends Bloc<TimedetailsnoteEvent, TimedetailsnoteState> {
  List<Map<String, dynamic>> taskList=[];
  TimedetailsnoteBloc() : super(TimedetailsnoteInitial()) {

    Box box = Hive.box('tasksBox');

    on<TaskAddEvent>((event, emit) async {
      final newTask = {
        'taskDesc': event.text,
        'taskdate': event.time,
      };
      await box.add(newTask);
      TimedetailsnoteBloc().add(TaskLoadedEvent());
    });

    on<TaskLoadedEvent>((event, emit) async {
      emit(TimedetailsnoteInitial());
      debugPrint('....//////////////');
      taskList=[];

  taskList = box.keys.map((key) {
        var value = box.get(key);
        return {
          'key': key,
          'taskDesc': value['taskDesc'],
          'taskdate': value['taskdate'],
        };
      }).toList();
        print('******************************************************');
        print(" vvvvvvvvvvvvv $taskList");


      emit(TimeLoadedState(taskList: taskList));
    });

    on<TaskDeleteEvent>((event, emit) async {
      await box.delete(event.taskKey);
      add(TaskLoadedEvent()); // Reload tasks after deletion
    });

    on<TaskshowDialogEvent>((event, emit) async {
      emit(TaskshowDialogstate());
      //add(TaskLoadedEvent()); // Reload tasks after deletion
    });


  }
}
