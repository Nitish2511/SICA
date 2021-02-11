import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoteDetail extends StatefulWidget{

  String appBarTitle;

  NoteDetail(this.appBarTitle);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NoteDetailState(appBarTitle);
  }
}

class _NoteDetailState extends State<NoteDetail>{

  String appBarTitle;

  _NoteDetailState(this.appBarTitle);

  static var _priorities = ['High','Low'];

  TextEditingController titleController = TextEditingController();
  TextEditingController discriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    TextStyle textStyle = Theme.of(context).textTheme.title;
    // TODO: implement build
    return WillPopScope(

      onWillPop: (){
        moveToLastScreen();
      },

      child: Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
        leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: (){
          moveToLastScreen();
        },),
      ),

      body: Padding(
        padding: EdgeInsets.only(top: 15.0,left: 10.0,right: 10.0),
        child: ListView(
          children: [
            ListTile(
              title: DropdownButton(
                items: _priorities.map((String dropDownStringItem){
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem),
                  );
                }).toList(),

                style: textStyle,

                value: 'Low',

                onChanged: (valueSelectedByUser){
                  setState(() {
                    debugPrint('User Selected $valueSelectedByUser');
                  });
                }
              )
            ),

            Padding(
              padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
              child: TextField(
                controller: titleController,
                style: textStyle,
                onChanged: (value){
                  debugPrint('Something changed in title textfield');
                },
                decoration: InputDecoration(
                  labelText: 'Title',
                  labelStyle: textStyle,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  )

                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
              child: TextField(
                controller: discriptionController,
                style: textStyle,
                onChanged: (value){
                  debugPrint('Something changed in discription textfield');
                },
                decoration: InputDecoration(
                    labelText: 'Discription',
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    )

                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
              child: Row(
                children: [
                  Expanded(
                    child: RaisedButton(
                      color: Theme.of(context).primaryColorDark,
                      textColor: Theme.of(context).primaryColorLight,
                      child: Text('Save',textScaleFactor: 1.5,),
                      onPressed: (){
                        setState(() {
                          debugPrint('Save Button Clicked');
                        });
                      },
                    )
                  ),

                  Container(
                    width: 5.0,
                  ),

                  Expanded(
                      child: RaisedButton(
                        color: Theme.of(context).primaryColorDark,
                        textColor: Theme.of(context).primaryColorLight,
                        child: Text('Delete',textScaleFactor: 1.5,),
                        onPressed: (){
                          setState(() {
                            debugPrint('Delete Button Clicked');
                          });
                        },
                      )
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }

  void moveToLastScreen(){
    Navigator.pop(context);
  }
}