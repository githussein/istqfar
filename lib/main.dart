import 'package:flutter/material.dart';
import 'package:istqfar/choose_azkar.dart';
import 'package:istqfar/favorites.dart';
import 'package:istqfar/hadith.dart';
import 'package:istqfar/misbaha.dart';
import 'package:istqfar/settings.dart';
import 'package:istqfar/story.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'DatabaseHelper.dart';
import 'Zekr.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Istqfar - استغفار',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Istqfar - استغفار'),
      // Directionality(
      //   textDirection:
      //       TextDirection.rtl, // To support right to left text direction
      //   child: MyHomePage(title: 'Istqfar - استغفار'),
      // ),
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
  //Default selected index from the bottom navigation bar
  int _selectedIndex = 2;
  // final List<Widget> _widgetOptions = [];

  FlutterLocalNotificationsPlugin flutterNotification;

  // List<Zekr> azkarList = new List();

  @override
  void initState() {
    super.initState();
    var androidInitialize = new AndroidInitializationSettings('app_icon');
    var iOSInitialize = new IOSInitializationSettings();
    var initializationSettings =
        new InitializationSettings(androidInitialize, iOSInitialize);
    flutterNotification = new FlutterLocalNotificationsPlugin();
    flutterNotification.initialize(initializationSettings,
        onSelectNotification: notificationSelected);

    //   ///// DATABASE /////
    //   DatabaseHelper.instance.queryAllRows().then((value) {
    //     setState(() {
    //       value.forEach((element) {
    //         azkarList.add(Zekr(id: element['id'], title: element["title"]));
    //       });
    //     });
    //   }).catchError((error) {
    //     print(error);
    //   });
  }

  Future notificationSelected(String payload) async {
    //CURRENTLY THE NOTIFICATION JUST TAKE THE USER TO THE APP
    // showDialog(
    //   context: context,
    //   builder: (context) => AlertDialog(
    //     content: Text("Notification : $payload"),
    //   ),
    // );
  }

  Future _showNotification() async {
    var androidDetails = new AndroidNotificationDetails(
        "Channel ID", "Desi programmer", "This is my channel",
        importance: Importance.Max);
    var iSODetails = new IOSNotificationDetails();
    var generalNotificationDetails =
        new NotificationDetails(androidDetails, iSODetails);

    // await flutterNotification.show(
    //     0, "Task", "You created a Task", generalNotificationDetails,
    //     payload: "Task");
    var scheduledTime = DateTime.now().add(Duration(hours: 1));
    flutterNotification.schedule(1, "تنبيه بالذكر", "سبحان الله وبحمده",
        scheduledTime, generalNotificationDetails);
  }

  @override
  Widget build(BuildContext context) {
    //show local notification after certain time
    _showNotification();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Container(
                    height: 150.0,
                    margin: EdgeInsets.all(10.0),
                    padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.60),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Misbaha()),
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ImageIcon(
                            AssetImage('images/icon-tasbih.png'),
                            size: 80.0,
                          ),
                          Text('سبحة')
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(10.0),
                    padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.60),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChooseAzkar()),
                        );
                      },
                      child: Column(
                        children: <Widget>[
                          ImageIcon(
                            AssetImage('images/icon-dua.png'),
                            size: 80.0,
                          ),
                          Text('أذكار')
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(10.0),
                    padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.60),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Story()),
                        );
                      },
                      child: Column(
                        children: <Widget>[
                          ImageIcon(
                            AssetImage('images/icon-reading.png'),
                            size: 80.0,
                          ),
                          Text('قصص')
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(10.0),
                    padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.60),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Hadith()),
                        );
                      },
                      child: Column(
                        children: <Widget>[
                          ImageIcon(
                            AssetImage('images/icon-mhmd.png'),
                            size: 80.0,
                          ),
                          Text('أحاديث')
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text(''),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: onTabTapped,
      ),
    );
  }

  void onTabTapped(int index) {
    //TEST
    if (index == 1) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Favorites()));
    } else if (index == 0) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Settings()));
    }
    // setState(() {
    //   _selectedIndex = index;
    // });
  }
}
