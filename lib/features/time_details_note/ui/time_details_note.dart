import 'dart:developer';

import 'package:bloc_practise/features/time_details_note/bloc/timedetailsnote_bloc.dart';
import 'package:bloc_practise/widgets/alert_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimeDetailsNote extends StatefulWidget {
  const TimeDetailsNote({super.key});

  @override
  State<TimeDetailsNote> createState() => _TimeDetailsNoteState();
}

class _TimeDetailsNoteState extends State<TimeDetailsNote> {

  TimedetailsnoteBloc timedetailsnoteBloc = TimedetailsnoteBloc();

  @override
  void initState() {
    timedetailsnoteBloc.add(TaskLoadedEvent());
    debugPrint("\\a\a\\a\a\\\\\\\\\\\\\\\\\\\\\\\\\\");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: BlocListener<TimedetailsnoteBloc, TimedetailsnoteState>(
        listener: (context, state) {
          if (state is TaskshowDialogstate){
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AddTaskAlertDialog();
              },
            );
          }
        },
        child: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            timedetailsnoteBloc.add(TaskshowDialogEvent());
          },
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Task List'),
        centerTitle: true,
      ),
      body: BlocBuilder<TimedetailsnoteBloc, TimedetailsnoteState>(
        bloc: timedetailsnoteBloc,
        //listenWhen: (previous, current) => current is TimedetailsnoteState,
        // buildWhen: (previous, current) => current is TimeLoadedState,
        /*listener: (context, state) {

          print('==================================');
          print(state);
          print('this is listener');},*/
        builder: (context, state) {
          print('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');


          if (state is TimedetailsnoteInitial) {
            return const CircularProgressIndicator();
          }

          else if (state is TimeLoadedState) {
            print(state);
            log(state.taskList.length.toString(),
                name: "----------------------");
            if (state.taskList.isEmpty) {
              return const Text('No Text Found');
            }

            else {
              // print('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
              return ListView.separated(
                padding: const EdgeInsets.all(10),
                separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(height: 10,),
                itemCount: state.taskList.length,
                itemBuilder: (context, index) {
                  var task = state.taskList[index];

                  return ListTile(
                    //shape: RoundedRectangleBorder(),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    minLeadingWidth: 50,
                    tileColor: Colors.teal.shade100,
                    title: Text(task['taskdate'] ?? 'No task name'),
                    subtitle: Text(task['taskDesc'] ?? 'No description'),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.delete_forever,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        timedetailsnoteBloc.add(
                            TaskDeleteEvent(taskKey: task['key']));
                      },
                    ),
                  );
                },
              );
            }
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
