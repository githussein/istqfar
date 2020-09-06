import 'package:flutter/material.dart';
import 'package:istqfar/counter.dart';
//import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Istqfar',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Istqfar'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Center(
              child: Text(
                'سبحان الله',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondRoute()),
                );
              },
              child: Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                color: Colors.green,
                child: (ListTile(
                  leading: Icon(
                    Icons.location_on,
                    color: Colors.white,
                  ),
                  title: Text(
                    'استغفر الله',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                )),
              ),
            ),
            FlatButton(
              onPressed: () {},
              child: Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                color: Colors.green,
                child: (ListTile(
                  leading: Icon(
                    Icons.location_on,
                    color: Colors.white,
                  ),
                  title: Text(
                    'سبحان الله',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                )),
              ),
            ),
            FlatButton(
              onPressed: () {},
              child: Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                color: Colors.green,
                child: (ListTile(
                  leading: Icon(
                    Icons.location_on,
                    color: Colors.white,
                  ),
                  title: Text(
                    'الحمد لله',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                )),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
