import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:todo_app/widgets/task_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

bool show =true;

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      floatingActionButton: Visibility(
        visible: show,
        child: FloatingActionButton(
          onPressed: () {  },
          child: Icon(Icons.add,size: 40,),
        ),
      ),
      body: SafeArea(
        child: NotificationListener<UserScrollNotification>(
          onNotification: (notification){
            if(notification.direction ==ScrollDirection.forward){
              setState(() {
                show = true;
              });
            } if(notification.direction ==ScrollDirection.reverse){
              setState(() {
                show = false;
              });
            }return true;
          },
          child: ListView.builder(itemBuilder: (context, index) {
          return Task_Widget();
          },
            itemCount: 10,
          ),
        ),
      ),
    );
  }
}
