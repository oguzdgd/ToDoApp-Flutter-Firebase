import 'package:flutter/material.dart';
import 'package:todo_app/auth/auth_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:todo_app/screen/add_note_screen.dart';
import 'package:todo_app/screen/home.dart';
import 'package:todo_app/widgets/task_widget.dart';
import 'firebase_options.dart';

import 'screen/login.dart';
import 'screen/register.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Add_Note_Screen(),
    );
  }
}

