import 'package:first/modules/archived_tasks/archived_tasks_screen.dart';
import 'package:first/modules/done_tasks/done_tasks_screen.dart';
import 'package:first/modules/new_tasks/new_tasks_screen.dart';
import 'package:first/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

class TodoApp extends StatefulWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  _TodoAppState createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
//   int currentIndex = 0;
//
//   List<Widget> screens = [
//     NewTasks(),
//     DoneTasks(),
//     ArchivedTasks(),
//   ];
//
//   List<String> titles = [
//     'New Tasks',
//     'Done Tasks',
//     'Archived Tasks',
//   ];
//
//   late Database database;
//   var scaffoldKey = GlobalKey<ScaffoldState>();
//   var formKey = GlobalKey<FormState>();
//   bool isBottomSheetShown = false;
//   IconData fabIcon = Icons.edit;
//   var titleController = TextEditingController();
//   var timeController = TextEditingController();
//   var dateController = TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//
//     createDatabase();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: scaffoldKey,
//       appBar: AppBar(
//         title: Text(
//           titles[currentIndex],
//         ),
//       ),
//       body: screens[currentIndex],
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           if (isBottomSheetShown)
//           {
//             if (formKey.currentState!.validate())
//             {
//               insertToDatabase(
//                 title: titleController.text,
//                 date: dateController.text,
//                 time: timeController.text,
//               ).then((value)
//               {
//                 Navigator.pop(context);
//                 isBottomSheetShown = false;
//                 setState(() {
//                   fabIcon = Icons.edit;
//                 });
//               });
//             }
//           } else
//           {
//             scaffoldKey.currentState?.showBottomSheet(
//                   (context) => Container(
//                 color: Colors.white,
//                 padding: EdgeInsets.all(
//                   20.0,
//                 ),
//                 child: Form(
//                   key: formKey,
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       DefaultFormFeild(
//                         controller: titleController,
//                         type: TextInputType.text,
//                         validate: (String value) {
//                           if (value.isEmpty) {
//                             return 'title must not be empty';
//                           }
//
//                           return null;
//                         },
//                         label: 'Task Title',
//                         prefix: Icons.title,
//                       ),
//                       SizedBox(
//                         height: 15.0,
//                       ),
//                       TappedFormFeild(
//                         controller: timeController,
//                         type: TextInputType.datetime,
//                         onTap: () {
//                           showTimePicker(
//                             context: context,
//                             initialTime: TimeOfDay.now(),
//                           ).then((value) {
//                             timeController.text =
//                                 value!.format(context).toString();
//                             print(value.format(context));
//                           });
//                         },
//                         validate: (String value) {
//                           if (value.isEmpty) {
//                             return 'time must not be empty';
//                           }
//
//                           return null;
//                         },
//                         label: 'Task Time',
//                         prefix: Icons.watch_later_outlined,
//                       ),
//                       SizedBox(
//                         height: 15.0,
//                       ),
//                       TappedFormFeild(
//                         controller: dateController,
//                         type: TextInputType.datetime,
//                         onTap: () {
//                           showDatePicker(
//                             context: context,
//                             initialDate: DateTime.now(),
//                             firstDate: DateTime.now(),
//                             lastDate: DateTime.parse('2021-05-03'),
//                           ).then((value) {
//                             dateController.text =
//                                 DateFormat.yMMMd().format(value!);
//                           });
//                         },
//                         validate: (String value) {
//                           if (value.isEmpty) {
//                             return 'date must not be empty';
//                           }
//
//                           return null;
//                         },
//                         label: 'Task Date',
//                         prefix: Icons.calendar_today,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               elevation: 20.0,
//             );
//             isBottomSheetShown = true;
//             setState(() {
//               fabIcon = Icons.add;
//             });
//           }
//         },
//         child: Icon(
//           fabIcon,
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         currentIndex: currentIndex,
//         onTap: (index) {
//           setState(() {
//             currentIndex = index;
//           });
//         },
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.menu,
//             ),
//             label: 'Tasks',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.check_circle_outline,
//             ),
//             label: 'Done',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.archive_outlined,
//             ),
//             label: 'Archived',
//           ),
//         ],
//       ),
//     );
//   }
//
//   // Instance of 'Future<String>'
//
//   Future<String> getName() async {
//     return 'Ahmed Ali';
//   }
//
//   void createDatabase() async {
//     database = await openDatabase(
//       'todo.db',
//       version: 1,
//       onCreate: (database, version) {
//         // id integer
//         // title String
//         // date String
//         // time String
//         // status String
//
//         print('database created');
//         database
//             .execute(
//             'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT)')
//             .then((value) {
//           print('table created');
//         }).catchError((error) {
//           print('Error When Creating Table ${error.toString()}');
//         });
//       },
//       onOpen: (database) {
//         print('database opened');
//       },
//     );
//   }
//
//   Future insertToDatabase({
//     required String title,
//     required String time,
//     required String date,
//   }) async {
//     return await database.transaction((txn)
//     {
//       txn
//           .rawInsert(
//         'INSERT INTO tasks(title, time, date, status) VALUES("$title", "$time", "$date", "new")',
//       )
//           .then((value) {
//         print('$value inserted successfully');
//       }).catchError((error) {
//         print('Error When Inserting New Record ${error.toString()}');
//       });
//
//       return null!;
//     });
//   }
// }
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

  void initState() {
    super.initState();
    createDB();
  }

  late Database database;

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
        onPressed: () {
          if (isBottomSheetShown) {
            Navigator.pop(context);
            isBottomSheetShown = false;
            setState(() {
              FABIcon = Icons.edit;
            });
            //  if(formKey.currentState!.validate())
            // {
            //    Navigator.pop(context);
            //    isBottomSheetShown = false;
            //    setState(() {
            //      FABIcon = Icons.edit;
            //    });
            //  } else{
            //    print('dlsafjksdngkj');
            //  }
          }
          else {
            scaffoldKey.currentState?.showBottomSheet((context) =>
                Container
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
                            validate: (String value) {
                              if (value.isEmpty) {
                                return 'title must not be empty';
                              }
                            }
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        TappedFormFeild(
                          controller: timeController,
                          type: TextInputType.datetime,
                          label: 'Task time',
                          prefix: Icons.watch_later_outlined,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'time must not be empty';
                            }
                          },
                          onTap: () {
                            showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );
                          },
                        ),
                        // DefaultFormFeild(
                        //     controller: dateController,
                        //     type: TextInputType.datetime,
                        //     label: 'Task Date',
                        //     // onTap: (){
                        //     //   showDatePicker(
                        //     //       context: context,
                        //     //       initialDate: DateTime.now(),
                        //     //       firstDate: DateTime.now(),
                        //     //       lastDate: DateTime.parse('2022-05-03'),
                        //     //   );
                        //     // },
                        //     prefix: Icons.calendar_today_outlined,
                        //     validate: (String value) {
                        //       if (value.isEmpty)
                        //       {
                        //         return 'date must not be empty';
                        //       }
                        //     }
                        // ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        TappedFormFeild(
                            controller: dateController,
                            type: TextInputType.datetime,
                            label: 'Task date',
                            prefix: Icons.calendar_today_outlined,
                            validate: (String value) {
                              if (value.isEmpty) {
                                return 'date must not be empty';
                              }
                            },
                            onTap: () {
                              showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime.parse('2022-05-03'),
                              );
                            }
                        ),
                        // DefaultFormFeild(
                        //     controller: timeController,
                        //     type: TextInputType.datetime,
                        //     label: 'Task time',
                        //     prefix: Icons.watch_later_outlined,
                        //     // onTap: (){
                        //     //   showTimePicker(
                        //     //       context: context,
                        //     //       initialTime: TimeOfDay.now(),
                        //     //   );
                        //     // },
                        //     validate: (String value){
                        //       if (value.isEmpty)
                        //       {
                        //         return 'time must not be empty';
                        //       }
                        //     }
                        // ),
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

  void createDB() async
  {
    database = await openDatabase(
        'Todo.db',
        version: 1,
        onCreate: (database, version) {
          print('Database Created');
          database.execute(
              'CREATE TABLE tasks(id INTEGER PRIMARY KEY, title TEXT , date TEXT , time TEXT , status TEXT)')
              .then((value) {
            print('table created');
          }).catchError((error) {
            print('error when creating table is : ${error.toString()}');
          });
        },
        onOpen: (database) {
          print('Database Opened');
        }
    );
  }

  Future insertToDb({
    required String title,
    required String time,
    required String date,}) async
  {
    return await database.transaction((txn) {
      txn.rawInsert(
          'INSERT INTO tasks (title , date , time , status ) VALUES("$title" , "$date" , "$time" , "new")')
          .then((value) {
        print('$value inserted successfully');
      }).catchError((error) {
        print('error when inserting new record : $error');
      });
      return null!;
    });
  }
}
