import 'package:first/modules/archived_tasks/archived_tasks_screen.dart';
import 'package:first/modules/done_tasks/done_tasks_screen.dart';
import 'package:first/modules/new_tasks/new_tasks_screen.dart';
import 'package:first/shared/components/components.dart';
import 'package:flutter/material.dart';

class TodoApp extends StatefulWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  _TodoAppState createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {

  int currentIndex = 0;

  List<Widget> screens =
  [
    NewTasks(),
    DoneTasks(),
    ArchivedTasks(),
  ];

  List<String> titles =
  [
    'New Tasks',
    'Done Tasks',
    'Archived Tasks',
  ];

  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();

  var titleController = TextEditingController();
  var dateController = TextEditingController();
  var timeController = TextEditingController();

  bool isBottomSheetShown = false;
  IconData FABIcon = Icons.edit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(
          titles[currentIndex],
        ),
        backgroundColor: Colors.teal,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()
        {
          if (isBottomSheetShown)
            {
              if(formKey.currentState!.validate())
             {
                Navigator.pop(context);
                isBottomSheetShown = false;
                setState(() {
                  FABIcon = Icons.edit;
                });
              } else{
                print('dlsafjksdngkj');
              }
            }
          else
            {
              scaffoldKey.currentState?.showBottomSheet((context) => Container
                (
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      DefaultFormFeild(
                          controller: titleController,
                          type: TextInputType.text,
                          label: 'Task title',
                          prefix: Icons.title,
                          validate: (String value){
                            if (value.isEmpty)
                            {
                              return 'title must not be empty';
                            }
                          }
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      DefaultFormFeild(
                          controller: dateController,
                          type: TextInputType.datetime,
                          label: 'Task Date',
                          prefix: Icons.calendar_today_outlined,
                          validate: (String value){
                            if (value.isEmpty)
                            {
                              return 'date must not be empty';
                            }
                          }
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      DefaultFormFeild(
                          controller: timeController,
                          type: TextInputType.datetime,
                          label: 'Task time',
                          prefix: Icons.watch_later_outlined,
                          validate: (String value){
                            if (value.isEmpty)
                            {
                              return 'time must not be empty';
                            }
                          }
                      ),
                    ],
                  ),
                ),
              ));
              isBottomSheetShown = true;
              setState(() {
                FABIcon = Icons.add;
              });
            }

        },
        child: Icon(FABIcon),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items:
        const [
          BottomNavigationBarItem(
              icon: Icon(Icons.menu),
            label: 'Tasks',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.check_circle_outline),
            label: 'Done',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.archive_outlined),
            label: 'Archived',
          ),
        ],
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
