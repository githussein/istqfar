import 'package:flutter/material.dart';
import 'package:istqfar/counter.dart';
import 'package:istqfar/choose_azkar.dart';
import 'package:istqfar/misbaha.dart';
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
  final List<Widget> _widgetOptions = [];

  FlutterLocalNotificationsPlugin fltrNotification;

  @override
  void initState() {
    super.initState();
    var androidInitilize = new AndroidInitializationSettings('app_icon');
    var iOSinitilize = new IOSInitializationSettings();
    var initilizationsSettings =
        new InitializationSettings(androidInitilize, iOSinitilize);
    fltrNotification = new FlutterLocalNotificationsPlugin();
    fltrNotification.initialize(initilizationsSettings,
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

    // await fltrNotification.show(
    //     0, "Task", "You created a Task", generalNotificationDetails,
    //     payload: "Task");
    var scheduledTime = DateTime.now().add(Duration(hours: 1));
    fltrNotification.schedule(1, "تنبيه بالذكر", "سبحان الله وبحمده",
        scheduledTime, generalNotificationDetails);
  }

  @override
  Widget build(BuildContext context) {
    //show local notification after certain time
    _showNotification();

    return Scaffold(
      backgroundColor: Colors.brown[200],
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: ListView(
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
              child: Column(
                children: <Widget>[
                  Text(
                    'آيـة اليـوم',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22.0,
                      color: Colors.brown[900],
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                    child: Divider(
                      color: Colors.brown[900],
                    ),
                  ),
                  Text(
                    'فَسَتَذْكُرُونَ مَا أَقُولُ لَكُمْ ۚ وَأُفَوِّضُ أَمْرِي إِلَى اللَّهِ ۚ إِنَّ اللَّهَ بَصِيرٌ بِالْعِبَادِ (44)',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'غـافـر',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      color: Colors.brown[900],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
              decoration: BoxDecoration(
                  color: Colors.brown[400],
                  border: Border.all(
                    color: Colors.brown[900],
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(45))),
              child: Column(
                children: <Widget>[
                  Text(
                    'حـديـث اليـوم',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22.0,
                      color: Colors.brown[900],
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                    child: Divider(
                      color: Colors.brown[900],
                    ),
                  ),
                  Text(
                    'أبشروا وأمّلوا ما يسركم، فوالله ما الفقر أخشى عليكم، ولكني أخشى أن تبسط الدنيا عليكم كما بسطت على من كان قبلكم، فتنافسوها كما تنافسوها، فتهلككم كما أهلكتهم',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'مـتـفـق عـلـيـه',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      color: Colors.brown[900],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
              decoration: BoxDecoration(
                  color: Colors.brown[400],
                  border: Border.all(
                    color: Colors.brown[900],
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(45))),
              child: Column(
                children: <Widget>[
                  Text(
                    'قـصـة الأسـبوع',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22.0,
                      color: Colors.brown[900],
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                    child: Divider(
                      color: Colors.brown[900],
                    ),
                  ),
                  Text(
                    'سعد بن أبي وقاص، خال رسول الله صلى الله عليه وسلم',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'نشأ سعد في قريش، واشتغل في بري السهام وصناعة القِسِيّ، وهذا عمل يؤهِّل صاحبه للائتلاف مع الرمي، وحياة الصيد والغزو، وكان يمضي وقته وهو يخالط شباب قريش وساداتهم، ويتعرف على الدنيا عن طريق الحجيج الوافد إلى مكة المكرمة في أيام الحج ومواسمها',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'كان ممن دعاهم أبو بكر للإسلام، فأسلم t مبكرًا، وهو ابن سبع عشرة سنة. وبعد إسلامه تركت أمه الطعام ليعود إلى الكفر، فقال لها: تعلمين والله يا أماه، لو كانت لك مائة نفس فخرجت نفسًا نفسًا، ما تركت ديني هذا لشيء؛ فإن شئت فكلي، وإن شئت لا تأكلي. فحلفتْ ألا تكلمه أبدًا حتى يكفر بدينه، ولا تأكل ولا تشرب؛ فأنزل الله : {وَوَصَّيْنَا الإِنْسَانَ بِوَالِدَيْهِ حُسْنًا وَإِنْ جَاهَدَاكَ لِتُشْرِكَ بِي مَا لَيْسَ لَكَ بِهِ عِلْمٌ فَلاَ تُطِعْهُمَا إِلَيَّ مَرْجِعُكُمْ فَأُنَبِّئُكُمْ بِمَا كُنْتُمْ تَعْمَلُونَ} [العنكبوت: 8]',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'وكان سعد بن أبي وقاص أحد الفرسان، وهو أول من رمى بسهمٍ في سبيل الله، وهو أحد الستة أصحاب الشورى',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'لم تعد حياة سعد ضياعًا في أحاديث التجارة أو اللغو، ولم يعد عمله في صنع السهام والقِسِيّ من أجل الربح، بل أصبح عمله جميعه موجَّهًا لهدف واحد، هو نصرة الدين، وإعلاء كلمة الله، والجهاد في سبيله بالمال والنفس والأهل والعشيرة؛ فقد شهد مع النبي غزوة بُواط وكان يحمل لواءها، وغزوة أُحد، وكان الرسول يعتمده في بعض الأعمال الخاصة، مثل إرساله مع علي بن أبي طالب والزبير بن العوام رضي الله عنهما بمهمة استطلاعية عند ماء بدر، وعندما عقد صلح الحديبية كان سعد بن أبي وقاص أحد شهود الصلح',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'تولى سعد بن أبي وقاص مهمة قيادة جيش المسلمين في أصعب مرحلة من مراحل الحرب في بلاد فارس والعراق، فاستطاع بفضل الله أولاً، ثم بكفاءته وقدرته القيادية وتوجيهات أمير المؤمنين وجيشٍ يملؤه الإيمان أن يهزم الفرس هزيمة ساحقة في القادسية',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/seb7ah.jpg"),
                      fit: BoxFit.cover)),
              child: Text(
                'استغفار - Istqfar',
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              title: Text('التنبيهات'),
              leading: Icon(Icons.alarm_on),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('حول التطبيق'),
              leading: Icon(Icons.mobile_screen_share),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('الإعدادات'),
              leading: Icon(Icons.settings),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
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
