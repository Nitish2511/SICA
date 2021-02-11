import 'package:flutter/material.dart';
import 'package:flutter_guide/SecondScreen.dart';
import 'package:flutter_guide/app_screens/firstScreen.dart';

void main(){
  runApp(MainScreen());
}

class MainScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'NoteKeeper',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch : Colors.deepPurple
      ),
      home: NoteList(),
    );
  }
}