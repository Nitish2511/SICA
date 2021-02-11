import 'package:flutter/material.dart';
import 'package:flutter_guide/SecondScreen.dart';
import 'package:flutter_guide/Utils/Database_helper.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:flutter_guide/Models/Note.dart'

class NoteList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NoteListState();
  }
}

class NoteListState extends State<NoteList> {

  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Note> noteList;
  int count = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          title: Text('Notes'),
        ),

        body: getListView(),

        floatingActionButton: FloatingActionButton(
          onPressed: (){
            debugPrint('FAB clicked');
            navigateToDetail('Add Note');
          },

          tooltip: 'Add Note',

          child: Icon(Icons.add),

        )
    );
  }

  ListView getListView() {
    TextStyle titleStyle = Theme.of(context).textTheme.subhead;

    return ListView.builder(
        itemCount: count,
        itemBuilder: (BuildContext context, int position) {
          return Card(
            color: Colors.white,
            elevation: 5.0,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.yellowAccent,
                child: Icon(Icons.keyboard_arrow_right),
              ),
              title: Text('Dummy Title',style: titleStyle),
              subtitle: Text('Dummy Subtitle'),

              trailing: Icon(Icons.delete,color: Colors.grey,),

              onTap: (){
                debugPrint('ListTile tapped');
                navigateToDetail('Edit Note');
              },
            ),
          );
        });
  }
  
  void navigateToDetail(String title){
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return NoteDetail(title);
    }));
  }
}