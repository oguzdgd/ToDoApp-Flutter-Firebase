import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/widgets/task_widget.dart';

import '../data/firestore_data.dart';

class StreamNote extends StatelessWidget {
  bool done;
  StreamNote(this.done,{super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder<QuerySnapshot>(
          stream: Firestore_Datasource().stream(done),
          builder: (context, snapshot) {
            if(!snapshot.hasData){
              print('Hata oluştu: veriler alındı');
              return CircularProgressIndicator();
            }
            final notesList = Firestore_Datasource().getNotes(snapshot);
            return ListView.builder(
              itemBuilder: (context, index) {
                final note = notesList[index];
                print("itemler dönecek...");
                return Dismissible(
                    key: UniqueKey(),
                    onDismissed: (direction){
                      Firestore_Datasource().DeleteNote(note.id);
                    },
                    child: Task_Widget(note));
              },
              itemCount: notesList.length,
            );
          }
        ),
    );
  }
}
