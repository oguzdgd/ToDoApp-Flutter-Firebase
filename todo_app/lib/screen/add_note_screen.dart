import 'package:flutter/material.dart';

class Add_Note_Screen extends StatefulWidget {
  const Add_Note_Screen({super.key});

  @override
  State<Add_Note_Screen> createState() => _Add_Note_ScreenState();
}

FocusNode _focusNodeTitle = FocusNode();
FocusNode _focusNodeSubtitle = FocusNode();

final title = TextEditingController();
final subtitle = TextEditingController();

class _Add_Note_ScreenState extends State<Add_Note_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            title_widdget(),
            SizedBox(height: 10,),
            subtitle_widget()
          ],
        ),
      ),
    );
  }

  Widget title_widdget() {
    return Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextField(
                controller: title,
                focusNode: _focusNodeTitle,
                style: TextStyle(fontSize: 18, color: Colors.black),
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    hintText: ' title',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.white, width: 2.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.red, width: 2.0),
                    )),
              ),
            ),
          );
  }

  Widget subtitle_widget() {
    return Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextField(
                controller: subtitle,
                maxLines: 3,
                focusNode: _focusNodeSubtitle,
                style: TextStyle(fontSize: 18, color: Colors.black),
                decoration: InputDecoration(
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    hintText: ' subtitle',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.white, width: 2.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.red, width: 2.0),
                    )),
              ),
            ),
          );
  }
}
