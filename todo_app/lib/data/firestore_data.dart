import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';

import '../model/notes_model.dart';

class Firestore_Datasource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> CreateUser(String email) async {
    try {
      await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .set({"id": _auth.currentUser!.uid, "email": email});
      return true;
    } catch (e) {
      print('Hata oluştu: $e  dataSource');
      return true;
    }
  }

  Future<bool> AddNote(String title, String subtitle, int image) async {
    var uuid = Uuid().v4();
    DateTime data = new DateTime.now();
    try {
      await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('notes')
          .doc(uuid)
          .set({
        'id': uuid,
        'title': title,
        'subtitle': subtitle,
        'isDone': false,
        'image': image,
        'time': '${data.hour}.${data.minute}'
      });
      return true;
    } catch (e) {
      print('Hata oluştu: $e AddNote');
      return true;
    }
  }

  List getNotes(AsyncSnapshot snapshot) {
    try {
      final notesList = snapshot.data.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return Note(
          data['id'],
          data['title'],
          data['subtitle'],
          data['time'],
          data['image'],
          data['isDone'],
        );
      }).toList();
      return notesList;
    } catch (e) {
      print('Hata oluştu: $e getNotes');
      return [];
    }
  }

  Stream<QuerySnapshot> stream(bool isDone) {
    return _firestore
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .collection('notes')
        .where('isDone',isEqualTo: isDone)
        .snapshots();
  }

  Future<bool> isDone(String uuid, bool isDone) async {
    try {
      await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('notes')
          .doc(uuid)
          .update({'isDone': isDone});
      return true;
    } catch (e) {
      print(e);
      return true;

    }
  }

  Future<bool> UpdateNote(
      String uuid, String title, String subtitle, int image) async {
    DateTime data = new DateTime.now();
    try {
      await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('notes')
          .doc(uuid)
          .update({
        'time': '${data.hour}.${data.minute}',
        'title': title,
        'subtitle': subtitle,
        'image': image,
      });
      return true;
    } catch (e) {
      return true;
      print(e);
    }
  }

  Future<bool> DeleteNote(String uuid) async{
    try{
      await _firestore.collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('notes')
          .doc(uuid)
          .delete();
      return true;
    }catch(e){
      return true;
      print(e);
    }
  }

}
