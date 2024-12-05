part of 'timedetailsnote_bloc.dart';

@immutable
abstract class TimedetailsnoteState {}

class TimedetailsnoteActionState extends TimedetailsnoteState{}

class TimedetailsnoteInitial extends TimedetailsnoteState {}

class HomeLoadedState extends TimedetailsnoteState {
  final List<Map<String, dynamic>> taskList;

  HomeLoadedState({required this.taskList});
}

class TaskDeleteState extends TimedetailsnoteActionState{
}