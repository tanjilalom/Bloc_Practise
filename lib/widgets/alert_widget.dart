import 'package:bloc_practise/features/time_details_note/bloc/timedetailsnote_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTaskAlertDialog extends StatefulWidget {
  final TimedetailsnoteBloc timedetailsnoteBloc;

  const AddTaskAlertDialog({super.key, required this.timedetailsnoteBloc});

  @override
  State<AddTaskAlertDialog> createState() => _AddTaskAlertDialogState();
}

class _AddTaskAlertDialogState extends State<AddTaskAlertDialog> {
  TimeOfDay selectedTime = TimeOfDay.now();

  final TextEditingController taskdateController = TextEditingController();
  final TextEditingController taskDescController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return AlertDialog(
      scrollable: true,
      title: const Text(
        'New Task',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16, color: Colors.brown),
      ),
      content: SizedBox(
        height: height * 0.35,
        width: width,
        child: Form(
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: taskdateController,
                      style: const TextStyle(fontSize: 14),
                      decoration: InputDecoration(
                        enabled: false,
                        hintText: 'Time',
                        hintStyle: const TextStyle(fontSize: 14),
                        icon: const Icon(CupertinoIcons.clock,
                            color: Colors.brown),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  ElevatedButton(
                    onPressed: () async {
                      final TimeOfDay? timeOfDay = await showTimePicker(
                        context: context,
                        initialTime: selectedTime,
                        initialEntryMode: TimePickerEntryMode.dial,
                      );
                      if (timeOfDay != null) {
                        taskdateController.text = timeOfDay.format(context);
                      }
                    },
                    child: const Text('Choose Time'),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: taskDescController,
                keyboardType: TextInputType.multiline,
                maxLines: 6,
                style: const TextStyle(fontSize: 14),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  hintText: 'Description',
                  hintStyle: const TextStyle(fontSize: 14),
                  icon: const Icon(CupertinoIcons.bubble_left_bubble_right,
                      color: Colors.brown),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () async {
            final taskdate = taskdateController.text;
            final taskDesc = taskDescController.text;

            if (taskdate.isNotEmpty && taskDesc.isNotEmpty) {
              try {
                //context.read<TimedetailsnoteBloc>().add(TaskAddEvent(time: taskdate, text: taskDesc));
                //context.read<TimedetailsnoteBloc>().add(TaskLoadedEvent());

                widget.timedetailsnoteBloc
                    .add(TaskAddEvent(time: taskdate, text: taskDesc));
                widget.timedetailsnoteBloc.add(TaskLoadedEvent());
                Navigator.of(context).pop();
              } catch (e) {
                debugPrint(e.toString());
              }
            } else {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Error'),
                    content: const Text(
                        'Task name and description cannot be empty.'),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('OK'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            }
          },
          child: const Text('Save'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    taskdateController.dispose();
    taskDescController.dispose();
    super.dispose();
  }
}
