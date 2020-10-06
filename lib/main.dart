import 'package:flutter/material.dart';
import 'package:istqfar/choose_azkar.dart';
import 'package:istqfar/hadith.dart';
import 'package:istqfar/misbaha.dart';
import 'package:istqfar/story.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

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
  int _selectedIndex = 0;
  // final List<Widget> _widgetOptions = [];

  FlutterLocalNotificationsPlugin flutterNotification;

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
                            size: 100.0,
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
                            size: 100.0,
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
                            size: 100.0,
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
                            size: 100.0,
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
            icon: Icon(Icons.home),
            title: Text('الرئيسية'),
            backgroundColor: Colors.brown,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.playlist_add_check),
            title: Text('المسبحة'),
            backgroundColor: Colors.brown,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.alarm),
            title: Text('الأذكار'),
            backgroundColor: Colors.brown,
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
        context,
        MaterialPageRoute(builder: (context) => Misbaha()),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ChooseAzkar()),
      );
    }
    // setState(() {
    //   _selectedIndex = index;
    // });
  }
}
