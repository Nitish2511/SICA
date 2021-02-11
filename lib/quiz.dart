import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

void main(){
  runApp(MyApp());
}


class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp>{
  var _questionIndex = 0;
  void Answerquestion() {
    setState(() {
      _questionIndex = _questionIndex+1;
    });
    print(_questionIndex);

  }
  @override
  Widget build(BuildContext context){

    var questions = ['what\'s your favourite colour?','what\'s your favourite animal?','who\'s your favourite parent?'];
    var options = [['blue','black','red','orange'],['tiger','cat','dog','rabbit'],['mom','dad','both','both']];
    var images = ['images/th.jpg','images/3.jpg','images/2.jpg'];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home : Scaffold(
      appBar: AppBar(title: Text('MY QUIZ'),),
      body: Column(
        children: [

          Container(
            decoration: BoxDecoration(image: DecorationImage(image:AssetImage('images/1.jpg'),fit: BoxFit.cover)),

          ),
          Container(
            margin : EdgeInsets.all(20),
            width: double.infinity,
            child:Text(questions[_questionIndex],textAlign: TextAlign.center,style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),),

          Container(
            child: Image.asset(images[_questionIndex]),
          ),

          Container(
            margin : EdgeInsets.all(10),
            width: double.infinity,
            child:RaisedButton(child: Text(options[_questionIndex][0]),
              onPressed: Answerquestion,
              highlightColor: Colors.red,
              color: Colors.blue,),),
          Container(
            margin : EdgeInsets.all(10),
            width: double.infinity,
            child:RaisedButton(child: Text(options[_questionIndex][1]),
              onPressed: Answerquestion,
              color: Colors.blue,),),
          Container(
            margin : EdgeInsets.all(10),
            width: double.infinity,
            child:RaisedButton(child: Text(options[_questionIndex][2]),
              onPressed: Answerquestion,
              color: Colors.blue,),),
          Container(
            margin : EdgeInsets.all(10),
            width: double.infinity,
            child:RaisedButton(child: Text(options[_questionIndex][3]),
              onPressed: Answerquestion,
              color: Colors.blue,),),
        ],
      ),

    ));
  }
}