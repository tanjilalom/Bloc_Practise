part of 'timedetailsnote_bloc.dart';



abstract class TimedetailsnoteState extends Equatable {}

class TimedetailsnoteInitial extends TimedetailsnoteState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class TimeLoadedState extends TimedetailsnoteState {
  final List<Map<String, dynamic>> taskList;

  TimeLoadedState({required this.taskList});

  @override
  // TODO: implement props
  List<Object?> get props => [taskList];
}

class TaskDeleteState extends TimedetailsnoteState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class TaskshowDialogstate extends TimedetailsnoteState{
  @override
  // TODO: implement props
  List<Object?> get props =>[];
}