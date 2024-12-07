part of 'timedetailsnote_bloc.dart';

@immutable
abstract class TimedetailsnoteState {}

class TimedetailsnoteInitial extends TimedetailsnoteState {}

class TimeLoadedState extends TimedetailsnoteState {
  final List<Map<String, dynamic>> taskList;

  TimeLoadedState({required this.taskList});
}

class TaskDeleteState extends TimedetailsnoteState{
}