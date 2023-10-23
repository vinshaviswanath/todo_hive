import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todohive/homepage.dart';
import 'package:todohive/model/note_model.dart';

Future<void> main() async {
//initiate flutter
  await Hive.initFlutter();

  //open database box
  var box = await Hive.openBox('todo');

  //register adapter
  Hive.registerAdapter(NoteModelAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
   home: Homepage(),
    );
  }
}
