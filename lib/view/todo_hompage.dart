import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
import '../models/todo.dart';
import '../providers/todo_provider.dart';



class TodoHomePage extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>();

  final todoController = TextEditingController();
  final todoController2 = TextEditingController();


  @override
  Widget build(BuildContext context, ref) {
    final todoData = ref.watch(todoProvider);
    return Scaffold(
        body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: todoController,
                    onFieldSubmitted: (val){
                      if(val.isEmpty){
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                duration: Duration(seconds: 1),
                                content: Text('add some todo')
                            )
                        );
                      }else{
                        final newTodo = Todo(
                            dateTime: DateTime.now().toString(),
                            todo: val
                        );
                        ref.read(todoProvider.notifier).addTodo(newTodo);
                        todoController.clear();
                      }
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      border: OutlineInputBorder(),
                      focusedBorder: InputBorder.none,
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'add some todo',
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: todoData.length,
                        itemBuilder: (context, index){
                          DateTime now = DateTime.parse(todoData[index].dateTime);
                          String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);
                          final todo = todoData[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: ListTile(
                              leading: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(Icons.playlist_add_check_outlined),
                              ),
                              title: Text(todo.todo),
                              subtitle: Text(formattedDate),
                              trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                children: [
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: CircleBorder(side: BorderSide.none)
                                      ),
                                      onPressed:() {
                                       showDialog(context: context,
                                           builder:
                                           (context){
                                              return Container(

                                                child: AlertDialog(
                                                  title: Text('Update ${todo.todo}'),
                                                  content: Form(
                                                    // formkey to identify which index is selected
                                                    key: _formKey,
                                                    child: TextFormField(
                                                      // controller to create and store the  value
                                                      controller: todoController2..text=todo.todo,

                                                      //validator to define and use the value later on....
                                                      validator: (val2){
                                                        if(val2!.isEmpty){
                                                          return 'invalid';
                                                        }
                                                        else{
                                                          return null;
                                                        }
                                                      },
                                                      decoration: InputDecoration(
                                                        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                                        border: OutlineInputBorder(),
                                                        focusedBorder: InputBorder.none,
                                                        fillColor: Colors.white,
                                                        filled: true,
                                                        // hintText: '...',
                                                      ),
                                                    ),
                                                  ),
                                                  actions: [
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                      children: [
                                                        TextButton(onPressed: (){
                                                          //a condition to check whether the form is empty or not and if not taking the value from controller.
                                                          if(_formKey.currentState!.validate()){

                                                            final newTodo2 = Todo(
                                                                dateTime: DateTime.now().toString(),
                                                                todo: todoController2.text
                                                            );
                                                            ref.read(todoProvider.notifier).updateTodo(index, newTodo2);


                                                          }
                                                          // todoController2.clear();
                                                          Navigator.pop(context);

                                                        }
                                                            , child: Text('Update')),
                                                        // SizedBox(width: 10.w,),
                                                        TextButton(onPressed: (){

                                                          Navigator.pop(context);

                                                        }, child: Text('Cancel')),
                                                      ],
                                                    )

                                                  ],

                                                ),
                                              );
                                           }
                                       );

                                      // ref.read(todoProvider.notifier).updateTodo(index, todo);
                                      },
                                      child: Icon(Icons.edit_note_outlined)
                                              ),
                                  // SizedBox(width: 10.w),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: CircleBorder(side: BorderSide.none)
                                    ),
                                      onPressed: () {

                                      Get.defaultDialog(

                                        title: 'Delete',


                                        content: Text('Are you sure?'),

                                        actions: [
                                          TextButton(onPressed: (){
                                            Navigator.of(context).pop();
                                            ref.read(todoProvider.notifier).removeTodo(todo);

                                          }, child: Text('YES')),
                                          TextButton(onPressed: (){
                                            Navigator.of(context).pop();
                                          }, child: Text('NO'))
                                        ]


                                      );



                                      },
                                      child: Icon(Icons.delete)),

                                ],
                              ),

                            ),
                          );
                        }
                    ),
                  ),
                ],
              ),
            )
        )
    );
  }
}
