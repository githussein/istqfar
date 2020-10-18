import 'package:flutter/material.dart';
import 'package:istqfar/misbaha.dart';

class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  //The color of favorite icon
  Color _favIconColor = Colors.red[700];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("مفضلاتي"),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          child: ListView(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(10.0),
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.7),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: ListTile(
                  leading: IconButton(
                    icon: Icon(Icons.favorite_border, color: _favIconColor),
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
                  title: Text(
                    'الحمد لله حمدا كثيرا طيبا مباركا فيه',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ),
              // Container(
              //   margin: EdgeInsets.all(10.0),
              //   padding: EdgeInsets.all(5.0),
              //   decoration: BoxDecoration(
              //       color: Colors.white.withOpacity(0.7),
              //       borderRadius: BorderRadius.all(Radius.circular(15))),
              //   child: ListTile(
              //     leading: IconButton(
              //       icon: Icon(Icons.favorite_border, color: _favIconColor),
              //       onPressed: () {
              //         setState(() {
              //           if (_favIconColor == Colors.red[700]) {
              //             _favIconColor = Colors.grey;
              //           } else {
              //             _favIconColor = Colors.red[700];
              //           }
              //         });
              //       },
              //     ),
              //     title: Text(
              //       'اللهم صل على محمد وعلى آل محمد كما صليت على ابراهيم وعلى آل ابراهيم، وبارك على محمد وعلى آل محمد كما باركت على ابراهيم وعلى آل ابراهيم، إنك حميد مجيد',
              //       textAlign: TextAlign.center,
              //       style: TextStyle(fontSize: 18.0),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
