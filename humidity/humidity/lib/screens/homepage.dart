import 'package:flutter/material.dart';
import '../views/allsensor.dart';
import '../views/humidity.dart';
import '../views/pm25.dart';
import '../views/temperature.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

String username = "Atchaye Apattitetena";

Color headingFontColor = const Color.fromARGB(255, 0, 0, 0);
Color subheadFontColor = const Color.fromARGB(255, 112, 112, 112);
Color iconColor = const Color.fromARGB(255, 24, 22, 58);
Color navyBlue = const Color.fromARGB(255, 25, 23, 97); // For icons,..

class Home extends StatelessWidget {
  // const MyApp({super.key});

  final Function(int) fn;

  static const String _title = 'Head of Home';

  const Home(this.fn, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.transparent,
      debugShowCheckedModeBanner: false,
      // Application name
      title: _title,
      // theme: ThemeData(),
      home: SetupHeading(fn),
    );
  }
}

class SetupHeading extends StatelessWidget {
  // const MyStatelessWidget({super.key});
  //

  final Function(int) fn;

  const SetupHeading(
    this.fn, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          centerTitle: false,
          toolbarHeight: 70,
          leadingWidth: 70,
          // backgroundColor: Colors.transparent,
          backgroundColor: Colors.white,
          elevation: 0,
          leading: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white, // background
              // onPrimary: Colors.black, // foreground
            ),
            onPressed: () {
              // Navigator.push(
              //     context, MaterialPageRoute(builder: (context) => Profile()));
              fn(2);
            },
            child: const Icon(
              Icons.person_rounded,
              color: Colors.grey,
            ),
          ),
          title: Container(
            margin: const EdgeInsets.only(top: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Welcome Home,",
                  // selectionColor: subheadFontColor,
                  textAlign: TextAlign.left,
                  style: TextStyle(color: subheadFontColor, fontSize: 10),
                ),
                TextButton(
                  onPressed: () {
                    fn(2);
                  },
                  child: Text(
                    username,
                    selectionColor: headingFontColor,
                    textAlign: TextAlign.left,
                    style: TextStyle(color: headingFontColor, fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            // main
            Container(
              margin: const EdgeInsets.all(5.0),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notifications,
                      color: Color.fromARGB(255, 25, 23, 97),
                    ),
                    tooltip: "Notifications",
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add_box,
                      color: Color.fromARGB(255, 25, 23, 97),
                    ),
                    tooltip: "Nothing here. sorry",
                  ),
                ],
              ),
            )
          ],
          bottom: const TabBar(
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Color.fromARGB(255, 25, 23, 97),
            indicatorWeight: 2,
            tabs: <Widget>[
              Tab(
                text: "All Sensors",
              ),
              Tab(
                text: "Air Quality",
              ),
              Tab(
                text: "Temperature",
              ),
              Tab(
                text: "Humidity",
              ),

              // selectedItemColor: Colors.black,
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            Center(
              child: AllSensor(title: 'Tab one'),
            ),
            Center(
              child: PM25(title: 'Tab two'),
            ),
            Center(
              child: Temperature(title: 'Tab three'),
            ),
            Center(
              child: Humidity(title: 'Tab four'),
            ),
          ],
        ),
      ),
    );
  }
}
