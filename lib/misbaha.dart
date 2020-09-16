import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  final String zekrText; //if you have multiple values add here
  Counter(this.zekrText, {Key key}) : super(key: key);

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;
  int _totalCounter = 0;
  int _round = 1;

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              widget.zekrText,
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            Column(
              children: <Widget>[
                SizedBox(
                  height: 5.0,
                  width: 200.0,
                  child: Divider(
                    color: Colors.green,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '$_totalCounter ',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Text(
                      'العدد الكلي ',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.0,
                  width: 200.0,
                  child: Divider(
                    color: Colors.green,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '$_round',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Text(
                      'الدورة ',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.0,
                  width: 200.0,
                  child: Divider(
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Text(
                  'عدد المرات',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  '$_counter',
                  style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                ),
              ],
            ),
            FlatButton(
              onPressed: _incrementCounter,
              child: CircleAvatar(
                radius: 100.0,
                backgroundColor: Colors.green,
                child: CircleAvatar(
                  radius: 95.0,
                  backgroundImage: AssetImage('images/seb7ah.jpg'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
