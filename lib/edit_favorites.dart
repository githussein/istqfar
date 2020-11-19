import 'package:flutter/material.dart';
import 'package:istqfar/favorites.dart';
import 'DatabaseHelper.dart';
import 'Zekr.dart';

class EditFavorites extends StatefulWidget {
  @override
  _EditFavoritesState createState() => _EditFavoritesState();
}

class _EditFavoritesState extends State<EditFavorites> {
  TextEditingController textController = new TextEditingController();
  List<Zekr> azkarList = new List();

  @override
  void initState() {
    super.initState();

    DatabaseHelper.instanceFavorites.queryAllRows().then((value) {
      setState(() {
        value.forEach((element) {
          azkarList.add(Zekr(id: element['id'], title: element["title"]));
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
        title: Text("Favourites"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.done),
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    '/', (Route<dynamic> route) => false);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Favorites()));
              }),
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
          alignment: Alignment.topLeft,
          padding: EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: _addToAzkar,
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(hintText: "إضافة ذكر"),
                      controller: textController,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Expanded(
                child: Container(
                  child: azkarList.isEmpty
                      ? Container()
                      : ListView.builder(itemBuilder: (ctx, index) {
                          if (index == azkarList.length) return null;
                          return Container(
                            margin: EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.7),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: ListTile(
                              title: Text(azkarList[index].title),
                              trailing: IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () =>
                                    _deleteTask(azkarList[index].id),
                              ),
                            ),
                          );
                        }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _addToAzkar() async {
    String task = textController.text;
    //Check if it is not an empty string
    if (task != '') {
      var id = await DatabaseHelper.instanceFavorites.insert(Zekr(title: task));
      setState(() {
        azkarList.insert(0, Zekr(id: id, title: task));
      });
      clearName();
    }
  }

  clearName() {
    textController.text = '';
  }

  void _deleteTask(int id) async {
    await DatabaseHelper.instanceFavorites.delete(id);
    setState(() {
      azkarList.removeWhere((element) => element.id == id);
    });
  }
}
