import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Simple Interest Calculator App',
    home: SIform(),
    theme: ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.indigo,
      accentColor: Colors.indigoAccent,
    ),
  ));
}

class SIform extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SIformState();
  }
}

class _SIformState extends State<SIform> {
  var _formkey = GlobalKey<FormState>();

  var _currencies = ['Ruppees', 'Pounds', 'Dollars'];
  var _currentItemSelected = 'Ruppees';
  TextEditingController principalController = TextEditingController();
  TextEditingController roiController = TextEditingController();
  TextEditingController termController = TextEditingController();
  String text = '';

  @override
  Widget build(BuildContext context) {
    TextStyle textstyle = Theme.of(context).textTheme.title;
    // TODO: implement build
    return Scaffold(
//      resizeToAvoidBottomPadding: false,
      appBar: AppBar(title: Text('Simple Interest Calculator')),
      body: Form(
          key: _formkey,
          child: Padding(
//        margin: EdgeInsets.all(10.0),
            padding: EdgeInsets.only(top:50.0,left:10.0,right: 10.0,bottom: 10.0),
            child: ListView(children: [
              Container(
                child: Image.asset('images/ruppee logo.png', width: 300.0, height: 200.0),
              ),
              Container(
                height: 50.0,
              ),
              Padding(
                  padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    style: textstyle,
                    controller: principalController,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please enter the principal value';
                      }
                    },
                    decoration: InputDecoration(
                        labelText: 'Principal',
                        labelStyle: textstyle,
                        errorStyle: TextStyle(
                          color: Colors.yellowAccent,
                          fontSize: 15.0,
                        ),
                        hintText: 'Enter principle e.g. 12000',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  )),
              Padding(
                  padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    style: textstyle,
                    controller: roiController,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please enter the rate of interest on Principal value';
                      }
                    },
                    decoration: InputDecoration(
                        labelText: 'Rate Of Interest',
                        labelStyle: textstyle,
                        errorStyle: TextStyle(
                          color: Colors.yellowAccent,
                          fontSize: 15.0,
                        ),
                        hintText: 'In Percent',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  )),
              Padding(
                  padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                  child: Row(
                    children: [
                      Expanded(
                          child: TextFormField(
                        keyboardType: TextInputType.number,
                        style: textstyle,
                        controller: termController,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Please enter the time in years';
                          }
                        },
                        decoration: InputDecoration(
                            labelText: 'Term',
                            labelStyle: textstyle,
                            errorStyle: TextStyle(
                              color: Colors.yellowAccent,
                              fontSize: 15.0,
                            ),
                            hintText: 'In years',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                      )),
                      Container(
                        width: 25.0,
                      ),
                      Expanded(
                          child: DropdownButton<String>(
                        items: _currencies.map((String value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        value: _currentItemSelected,
                        onChanged: (String newValueSelected) {
                          _onDropdownItemSelected(newValueSelected);
                        },
                      ))
                    ],
                  )),
              Padding(
                  padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                  child: Row(
                    children: [
                      Expanded(
                          child: RaisedButton(
                              child: Text('Calculate', style: textstyle),
                              onPressed: () {
                                setState(() {
                                  if(_formkey.currentState.validate()) {
                                    this.text = _calculatefinalans();
                                  }
                                });
                              })),
                      Container(width: 25.0),
                      Expanded(
                          child: RaisedButton(
                              child: Text('Reset Now', style: textstyle),
                              onPressed: () {}))
                    ],
                  )),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(text),
              )
            ]),
          )),
    );
  }

  void _onDropdownItemSelected(String newValueSelected) {
    setState(() {
      this._currentItemSelected = newValueSelected;
    });
  }

  String _calculatefinalans() {
    double principal = double.parse(principalController.text);
    double roi = double.parse(roiController.text);
    double term = double.parse(termController.text);

    var finalvalue = principal + (principal * roi * term) / 100;
    String result =
        'Your total investment after $term years will be $finalvalue $_currentItemSelected';
    return result;
  }
}
