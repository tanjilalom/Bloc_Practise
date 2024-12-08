part of 'timedetailsnote_bloc.dart';

@immutable
abstract class TimedetailsnoteEvent extends Equatable{}

class TaskAddEvent extends TimedetailsnoteEvent {
  final String time;
  final String text;

  TaskAddEvent({required this.time, required this.text});

  @override
  // TODO: implement props
  List<Object?> get props => [time,text];
}

class TaskLoadedEvent extends TimedetailsnoteEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class TaskDeleteEvent extends TimedetailsnoteEvent {
  final int taskKey; // The key of the task to be deleted

  TaskDeleteEvent({required this.taskKey});

  @override
  // TODO: implement props
  List<Object?> get props => [taskKey];
}

class TaskshowDialogEvent extends TimedetailsnoteEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}