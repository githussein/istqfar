import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Counter extends StatefulWidget {
  final String zekrText;
  Counter(this.zekrText, {Key key}) : super(key: key);

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;
  int _totalCounter = 0;
  int _round = 1;
  int storedValue = 0;
  //For favourite icon
  Color _favIconColor = Colors.red[700];

  //Method to increment Zekr counter
  void _incrementCounter() {
    setState(() {
      _totalCounter++;

      if (_counter >= 33) {
        _counter = 1;
        _round++;
      } else {
        _counter++;
      }
    });
  }

  @override
  void initState() {
    //Read app settings and azkar counts from SharedPreferences
    _read();
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
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 10),
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.54),
                          border: Border.all(
                            color: Colors.brown[100],
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: FlatButton(
                        color: Colors.white.withOpacity(0.54),
                        onPressed: () {},
                        child: Row(
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.favorite_border,
                                  color: _favIconColor),
                              onPressed: () {
                                setState(() {
                                  if (_favIconColor == Colors.red[700]) {
                                    _favIconColor = Colors.grey;
                                  } else {
                                    _favIconColor = Colors.red[700];
                                  }
                                });
                              },
                            ),
                            Expanded(
                              child: Text(
                                widget.zekrText,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 22.0,
                                ),
                              ),
                            ),
                            Icon(Icons.keyboard_arrow_down),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.54),
                          border: Border.all(
                            color: Colors.brown[100],
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: FlatButton(
                        color: Colors.white.withOpacity(0.54),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              ' 1000 ',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 22.0,
                              ),
                            ),
                            Text(
                              ' هدف التكرار ',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 22.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                // Container(
                //   margin: EdgeInsets.all(5.0),
                //   padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                //   decoration: BoxDecoration(
                //       color: Colors.white.withOpacity(0.54),
                //       border: Border.all(
                //         color: Colors.brown[100],
                //       ),
                //       borderRadius: BorderRadius.all(Radius.circular(15))),
                //   child: Text(
                //     widget.zekrText,
                //     textAlign: TextAlign.center,
                //     style: TextStyle(
                //       fontSize: 22.0,
                //     ),
                //   ),
                // ),
                // Column(
                //   children: <Widget>[
                //     SizedBox(
                //       height: 5.0,
                //       child: Divider(
                //         color: Colors.brown[900],
                //       ),
                //     ),
                //     Row(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: <Widget>[
                //         Text(
                //           '$_totalCounter ',
                //           style: Theme.of(context).textTheme.headline6,
                //         ),
                //         Text(
                //           'العدد الكلي ',
                //           style: TextStyle(
                //               fontSize: 18.0, fontWeight: FontWeight.bold),
                //         ),
                //       ],
                //     ),
                //     SizedBox(
                //       height: 5.0,
                //       child: Divider(
                //         color: Colors.brown[900],
                //       ),
                //     ),
                //     Row(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: <Widget>[
                //         Text(
                //           '$_round',
                //           style: Theme.of(context).textTheme.headline6,
                //         ),
                //         Text(
                //           'الدورة ',
                //           style: TextStyle(
                //               fontSize: 18.0, fontWeight: FontWeight.bold),
                //         ),
                //       ],
                //     ),
                //     SizedBox(
                //       height: 5.0,
                //       child: Divider(
                //         color: Colors.brown[900],
                //       ),
                //     ),
                //   ],
                // ),
                // Column(
                //   children: <Widget>[
                //     Text(
                //       'العدد الحالي',
                //       style: TextStyle(
                //           fontSize: 20.0, fontWeight: FontWeight.bold),
                //     ),
                //     Text(
                //       '$_totalCounter',
                //       style: TextStyle(
                //           fontSize: 72,
                //           fontWeight: FontWeight.bold,
                //           color: Colors.brown),
                //     ),
                //   ],
                // ),
                InkWell(
                  onTap: _incrementCounter,
                  child: CircleAvatar(
                    radius: 120.0,
                    backgroundColor: Colors.white.withOpacity(0.66),
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
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _totalCounter = 0;
            });
          },
          tooltip: 'Increment',
          child: Icon(Icons.settings_backup_restore),
        ),
      ),
    );
  }

  _read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'my_int_key';
    final value = prefs.getInt(key) ?? 0;
    _totalCounter = value;
    setState(() {});
  }

  _save() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'my_int_key';
    prefs.setInt(key, _totalCounter);
  }
}
