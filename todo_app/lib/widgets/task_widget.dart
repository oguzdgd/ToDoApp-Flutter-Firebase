import 'package:flutter/material.dart';
import 'package:todo_app/data/firestore_data.dart';
import 'package:todo_app/screen/edit_screen.dart';

import '../model/notes_model.dart';

class Task_Widget extends StatefulWidget {
  Note _note;

  Task_Widget(this._note, {super.key});

  @override
  State<Task_Widget> createState() => _Task_WidgetState();
}

class _Task_WidgetState extends State<Task_Widget> {
  @override
  Widget build(BuildContext context) {
    bool isDone = widget._note.isDone;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Container(
        width: double.infinity,
        height: 130,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 7,
              spreadRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            children: [
              //image
              images(),
              SizedBox(
                width: 20,
              ),
              // title and subtitle
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget._note.title,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w400),
                        ),
                        Checkbox(
                          value: isDone,
                          activeColor: Colors.blue,
                          onChanged: (value) {
                            isDone = !isDone;
                            Firestore_Datasource()
                                .isDone(widget._note.id, isDone);
                          },
                        ),
                      ],
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Text(
                        widget._note.subtitle,
                        style:
                            TextStyle(fontSize:16 , color: Colors.grey.shade400,),

                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.access_time,
                                size: 20,
                                color: Colors.white,
                              ),
                              SizedBox(width: 5),
                              Text(
                                widget._note.time,
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.cyan.shade400,
                              padding: EdgeInsets.symmetric(
                                horizontal: 15,
                              ),
                              minimumSize: Size(100, 30)),
                        ),
                        edit_button(context),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton edit_button(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return Edit_Screen(widget._note);
            },
          ),
        );
      },
      child: Row(
        children: [
          Icon(
            Icons.edit,
            size: 20,
            color: Colors.white,
          ),
          SizedBox(width: 5),
          Text(
            "edit",
            style: TextStyle(color: Colors.black87),
          ),
        ],
      ),
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.cyan.shade100, minimumSize: Size(100, 30)),
    );
  }

  Container images() {
    return Container(
      width: 100,
      height: 130,
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage("images/${widget._note.image}.png"),
        ),
      ),
    );
  }
}
