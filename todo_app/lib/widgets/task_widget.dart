import 'package:flutter/material.dart';

class Task_Widget extends StatefulWidget {
  const Task_Widget({super.key});

  @override
  State<Task_Widget> createState() => _Task_WidgetState();
}

class _Task_WidgetState extends State<Task_Widget> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return

      Padding(
          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
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
                  //title andd subtitle
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'title',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w400),
                            ),
                            Checkbox(value: isChecked, onChanged: (value) {
                              isChecked =! isChecked;
                            },),
                          ],
                        ),
                        Text(
                          'subtitle',
                          style: TextStyle(
                              fontSize: 16, color: Colors.grey.shade400),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ElevatedButton(onPressed: () {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Icon(Icons.access_time,size: 20,color: Colors.white,),
                                    Text("time",style: TextStyle(color: Colors.white),),
                                  ],
                                ),
                              style: ButtonStyle(
                                fixedSize: MaterialStateProperty.all(Size(100, 30)),
                                backgroundColor: MaterialStateProperty.all(Colors.blue),
                                minimumSize: MaterialStateProperty.all(Size(25,25))
                              ),
                              ),
                            SizedBox(width: 10,),
                            ElevatedButton(onPressed: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(Icons.edit,size: 20,color: Colors.white,),
                                  Text("edit",style: TextStyle(color: Colors.white),),
                                ],
                              ),
                              style: ButtonStyle(
                                  fixedSize: MaterialStateProperty.all(Size(100, 30)),
                                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                                  minimumSize: MaterialStateProperty.all(Size(25, 25)),
                              ),
                            ),
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

  Container images() {
    return Container(
      width: 100,
      height: 130,
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage("images/table_tennis.jpg"),
        ),
      ),
    );
  }
}
