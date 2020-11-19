import 'package:flutter/material.dart';
import 'package:istqfar/edit_favorites.dart';
import 'DatabaseHelper.dart';
import 'Zekr.dart';

class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  List<Zekr> azkarkList = new List();

  @override
  void initState() {
    super.initState();

    ///// DATABASE /////
    DatabaseHelper.instanceFavorites.queryAllRows().then((value) {
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
    return Scaffold(
      appBar: AppBar(
        title: Text("مفضلاتي"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => EditFavorites())),
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          child: ListView.builder(itemBuilder: (ctx, index) {
            if (index == azkarkList.length) return null;
            return Container(
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.7),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: ListTile(
                title: Text(
                  azkarkList[index].title,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
