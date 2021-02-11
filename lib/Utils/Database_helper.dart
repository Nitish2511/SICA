import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_guide/Models/Note.dart';

class DatabaseHelper{

  static DatabaseHelper _databaseHelper;
  static Database _database;

  String noteTable = 'note_table';
  String colId = 'id';
  String colTitle = 'title';
  String colDiscription = 'discrition';
  String colDate = 'date';
  String colPriority  = 'priority';

  DatabaseHelper._createinstance();

  factory DatabaseHelper(){
    if(_databaseHelper == 0) {
      _databaseHelper = DatabaseHelper._createinstance();
    }
    return _databaseHelper;
  }

  Future<Database> get database async{

    if(_database == null){
      _database = await initializeDatabase();
    }

    return _database;
  }

  Future<Database> initializeDatabase() async{

    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'notes.db';

    var noteDatabase = await openDatabase(path,version: 1,onCreate: _createDb);
    return noteDatabase;
  }

  void _createDb(Database db, int newVersion) async{
    await db.execute('CREATE TABLE $noteTable($colId INTEGER PRIMARY KEY AUTOINCREMENT,$colTitle TEXT,$colDiscription TEXT,$colDate TEXT,$colPriority INTEGER)');
  }

  Future<List<Map<String,dynamic>>> getNoteMapList() async {
    Database db = await this.database;

    var result = await db.query(noteTable,orderBy:'$colPriority ASC');

    return result;
  }
  Future<int> insertNote (Note note) async {
    Database db = await this.database;
    var result = await db.insert(noteTable, note.ToMap());
    return result;
  }
  Future<int> updateNote (Note note) async {
    Database db = await this.database;
    var result = await db.update(noteTable, note.ToMap(),where: '$colId = ?',whereArgs: [note.id]);
    return result;
  }
  Future<int> deleteNote(int id) async{
    Database db = await this.database;
    var result = await db.rawDelete('DELETE FROM $noteTable WHERE $colId = $id');
    return result;
  }
  Future<int> getCount() async{
    Database db = await this.database;
    List<Map<String, dynamic>> x = await db.rawQuery('SELECT COUNT (*) from $noteTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }



  }