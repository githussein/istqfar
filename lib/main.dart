import 'package:flutter/material.dart';
import 'package:istqfar/misbaha.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Istqfar ',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Istqfar - استغفار'),
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
  // int _counter = 0;
  //
  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Counter('استغفر الله')),
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
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Counter('سبحان الله')),
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
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Counter('الحمد لله')),
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
                    'الحمد لله',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                )),
              ),
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Counter('الله أكبر')),
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
                    'الله أكبر',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                )),
              ),
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Counter('لا إله إلا الله')),
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
                    'لا إله إلا الله',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                )),
              ),
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          Counter('لا حول ولا قوة إلا بالله')),
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
                    'لا حول ولا قوة إلا بالله',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                )),
              ),
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Counter('اللهم صل على نبينا محمد')),
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
                    'اللهم صل على نبينا محمد',
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

      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ),

      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('الرئيسية'),
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.playlist_add_check),
            title: Text('المسبحة'),
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.alarm),
            title: Text('الأذكار'),
            backgroundColor: Colors.green,
          ),
        ],
      ),
    );
  }
}
