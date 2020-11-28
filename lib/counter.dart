import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:numberpicker/numberpicker.dart';
import 'DatabaseHelper.dart';
import 'Zekr.dart';

class Counter extends StatefulWidget {
  final String zekrText;
  Counter(this.zekrText, {Key key}) : super(key: key);

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  //*****NUMBER PICKER*****//
  int _targetValue = 100;
  NumberPicker integerNumberPicker;
  NumberPicker horizontalNumberPicker;

  int _totalCounter = 0;
  int storedValue = 0;

  //For favourite icon
  Color _favIconColor = Colors.grey;

  //Method to increment Zekr counter
  void _incrementCounter() {
    setState(() {
      if (_totalCounter < _targetValue) _totalCounter++;
    });
  }

  //a list to read all azkar in the database
  List<Zekr> azkarkList = new List();
  static final favoritesTable = 'favorites';

  @override
  void initState() {
    super.initState();

    //Read app settings and azkar counts from SharedPreferences
    _read();

    ///// DATABASE /////
    DatabaseHelper.instance.queryAllRows(favoritesTable).then((value) {
      setState(() {
        value.forEach((element) {
          azkarkList.add(Zekr(id: element['id'], title: element["title"]));
        });
      });
    }).catchError((error) {
      print(error);
    });
  }

  @override
  Widget build(BuildContext context) {
    //Override the back button to save numbers of azkar
    return WillPopScope(
      onWillPop: () {
        _save();

        //trigger leaving and use own data
        Navigator.pop(context, false);

        //we need to return a future
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("السبحة"),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.54),
                        border: Border.all(
                          color: Colors.brown[100],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: ExpansionTile(
                      backgroundColor: Colors.white.withOpacity(0.54),
                      leading: IconButton(
                        icon: Icon(Icons.favorite_border, color: _favIconColor),
                        onPressed: () {
                          setState(() {
                            if (_favIconColor == Colors.grey) {
                              _favIconColor = Colors.red[700];
                              _addToFavorites();
                            }
                          });
                        },
                      ),
                      title: Text(
                        widget.zekrText,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22.0,
                        ),
                      ),
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Divider(
                              color: Colors.brown,
                            ),
                            RaisedButton(
                              color: Colors.brown[100],
                              onPressed: () => _showIntDialog(),
                              child: new Text("هدف التكـرار:  $_targetValue "),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Container(
                  //   margin: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 10),
                  //   decoration: BoxDecoration(
                  //       color: Colors.white.withOpacity(0.54),
                  //       border: Border.all(
                  //         color: Colors.brown[100],
                  //       ),
                  //       borderRadius: BorderRadius.all(Radius.circular(15))),
                  //   child: FlatButton(
                  //     color: Colors.white.withOpacity(0.54),
                  //     onPressed: () {},
                  //     child: Row(
                  //       children: <Widget>[
                  //         IconButton(
                  //           icon: Icon(Icons.favorite_border,
                  //               color: _favIconColor),
                  //           onPressed: () {
                  //             setState(() {
                  //               if (_favIconColor == Colors.red[700]) {
                  //                 _favIconColor = Colors.grey;
                  //               } else {
                  //                 _favIconColor = Colors.red[700];
                  //               }
                  //             });
                  //           },
                  //         ),
                  //         Expanded(
                  //           child: Text(
                  //             widget.zekrText,
                  //             textAlign: TextAlign.center,
                  //             style: TextStyle(
                  //               fontSize: 22.0,
                  //             ),
                  //           ),
                  //         ),
                  //         Icon(Icons.keyboard_arrow_down),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  Container(
                    margin: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.54),
                        border: Border.all(
                          color: Colors.brown[100],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '$_targetValue',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                        Text(
                          ' هدف التكرار ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: _incrementCounter,
                child: CircleAvatar(
                  radius: 100.0,
                  backgroundColor: Colors.white.withOpacity(0.77),
                  child: Text(
                    '$_totalCounter',
                    style: TextStyle(
                        fontSize: 72,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown),
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white.withOpacity(0.55),
          onPressed: () {
            setState(() {
              _totalCounter = 0;
            });
          },
          tooltip: 'Increment',
          child: Icon(
            Icons.settings_backup_restore,
            color: Colors.brown,
          ),
        ),
      ),
    );
  }

  _read() async {
    final prefs = await SharedPreferences.getInstance();
    final intKey = 'my_int_key';
    final intValue = prefs.getInt(intKey) ?? 0;
    _totalCounter = intValue;

    //load Favourites string list
    final stringPrefs = await SharedPreferences.getInstance();
    final stringListKey = 'string_list_key';
    final stringValue = stringPrefs.getStringList(stringListKey) ?? "";

    //Update view
    setState(() {});
  }

  _save() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'my_int_key';
    prefs.setInt(key, _totalCounter);
  }

  void _initializeNumberPickers() {
    integerNumberPicker = new NumberPicker.integer(
      initialValue: _targetValue,
      minValue: 0,
      maxValue: 100,
      step: 10,
      onChanged: (value) => setState(() => _targetValue = value),
    );
  }

  Future _showIntDialog() async {
    await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        return new NumberPickerDialog.integer(
          minValue: 10,
          maxValue: 1000,
          step: 10,
          initialIntegerValue: _targetValue,
        );
      },
    ).then((num value) {
      if (value != null) {
        setState(() => _targetValue = value);
        integerNumberPicker.animateInt(value);
      }
    });
  }

  //Add zekr to favorites database
  void _addToFavorites() async {
    await DatabaseHelper.instance
        .insert(Zekr(title: widget.zekrText), favoritesTable);
  }
}
