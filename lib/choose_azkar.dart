import 'package:flutter/material.dart';
import 'package:istqfar/azkar.dart';

class ChooseAzkar extends StatefulWidget {
  @override
  _ChooseAzkarState createState() => _ChooseAzkarState();
}

class _ChooseAzkarState extends State<ChooseAzkar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[200],
      appBar: AppBar(
        title: Text("أذكار المسلم"),
      ),
      body: Container(
        child: ListView(
          padding: EdgeInsets.all(10.0),
          children: <Widget>[
            FlatButton(
              padding: EdgeInsets.all(30.0),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Azkar(0)),
                );
              },
              color: Colors.brown[400],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.brown[900])),
              child: Text(
                'أذكار بعد الصلاة',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            FlatButton(
              padding: EdgeInsets.all(30.0),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Azkar(1)),
                );
              },
              color: Colors.brown[400],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.brown[900])),
              child: Text(
                'أذكار الوضوء',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            FlatButton(
              padding: EdgeInsets.all(30.0),
              onPressed: () {},
              color: Colors.brown[400],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.brown[900])),
              child: Text(
                'أذكار الصباح',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            FlatButton(
              padding: EdgeInsets.all(30.0),
              onPressed: () {},
              color: Colors.brown[400],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.brown[900])),
              child: Text(
                'أذكار المساء',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            FlatButton(
              padding: EdgeInsets.all(30.0),
              onPressed: () {},
              color: Colors.brown[400],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.brown[900])),
              child: Text(
                'أذكار النوم',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            FlatButton(
              padding: EdgeInsets.all(30.0),
              onPressed: () {},
              color: Colors.brown[400],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.brown[900])),
              child: Text(
                'أذكار الاستيقاظ',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            FlatButton(
              padding: EdgeInsets.all(30.0),
              onPressed: () {},
              color: Colors.brown[400],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.brown[900])),
              child: Text(
                'أذكار السفر',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
