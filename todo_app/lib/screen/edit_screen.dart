import 'package:flutter/material.dart';

class Edit_Screen extends StatefulWidget {
  const Edit_Screen({super.key});

  @override
  State<Edit_Screen> createState() => _Edit_ScreenState();
}

FocusNode _focusNodeTitle = FocusNode();
FocusNode _focusNodeSubtitle = FocusNode();

final title = TextEditingController();
final subtitle = TextEditingController();

int pictureIndex = 0;

class _Edit_ScreenState extends State<Edit_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            title_widdget(),
            SizedBox(
              height: 20,
            ),
            subtitle_widget(),
            SizedBox(
              height: 20,
            ),
            images(),
            SizedBox(
              height: 20,
            ),
            buttons(context)
          ],
        ),
      ),
    );
  }

  Widget buttons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber, minimumSize: Size(170, 50)),
          child: Text(
            "Add Task",
            style: TextStyle(color: Colors.white),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red, minimumSize: Size(170, 50)),
          child: Text("Cancel", style: TextStyle(color: Colors.white)),
        )
      ],
    );
  }

  Widget images() {
    return Container(
      height: 170,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                pictureIndex = index;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      width: 2,
                      color:
                      pictureIndex == index ? Colors.amber : Colors.grey)),
              width: 140,
              margin: EdgeInsets.all(8),
              child: Column(
                children: [Image.asset('images/${index}.png')],
              ),
            ),
          );
        },
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
