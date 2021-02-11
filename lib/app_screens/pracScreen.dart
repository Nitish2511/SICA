import 'package:flutter/material.dart';

void main() => runApp(MyPage());

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('My Random Page'),
            leading: Icon(Icons.menu),
            elevation: 7.0),
        body: Column(
          children: [
            Container(
              child: Image.asset('images/1.jpg'),
            ),
            Container(
              child:getList(),
            )
          ],
        )
      )
    );
  }
}

Widget getList() {
  var listview = ListView(
    children: [
      ListTile(title: Text('My Title'),
        subtitle: Text('This is my Subtitle', style: TextStyle(
            fontWeight: FontWeight.bold, decoration: TextDecoration.none),),),

      ListTile(title: Text('Description Heading'),subtitle: Text('This is my Description'))
    ],
  );
      return listview;
}