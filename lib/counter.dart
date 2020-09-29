import 'package:flutter/material.dart';

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
      backgroundColor: Colors.brown[200],
      appBar: AppBar(
        title: Text("المسبحة"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
              decoration: BoxDecoration(
                  color: Colors.brown[400],
                  border: Border.all(
                    color: Colors.brown[900],
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(45))),
              child: Text(
                widget.zekrText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0,
                  color: Colors.white,
                ),
              ),
            ),
            Column(
              children: <Widget>[
                SizedBox(
                  height: 5.0,
                  child: Divider(
                    color: Colors.brown[900],
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
                  child: Divider(
                    color: Colors.brown[900],
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
                  child: Divider(
                    color: Colors.brown[900],
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Text(
                  'العدد الحالي',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  '$_counter',
                  style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown),
                ),
              ],
            ),
            FlatButton(
              onPressed: _incrementCounter,
              child: CircleAvatar(
                radius: 100.0,
                backgroundColor: Colors.brown,
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