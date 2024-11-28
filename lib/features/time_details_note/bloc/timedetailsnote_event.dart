part of 'timedetailsnote_bloc.dart';

@immutable
abstract class TimedetailsnoteEvent {}

class TaskAddEvent extends TimedetailsnoteEvent {
  final String time;
  final String text;

  TaskAddEvent({required this.time, required this.text});
}

class TaskLoadedEvent extends TimedetailsnoteEvent {}

class TaskDeleteEvent extends TimedetailsnoteEvent {
  final int taskKey; // The key of the task to be deleted

  TaskDeleteEvent({required this.taskKey});
}