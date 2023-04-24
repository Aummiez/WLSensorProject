import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:humidity/model/weather.dart';
import 'package:humidity/screens/loginpage.dart';
import 'package:humidity/screens/weatherpage.dart';

import '../screens/homepage.dart';
import '../screens/profilepage.dart';

// import 'temperature.dart';

String username = "Atchaye Apattitetena";
String location = "Hyuga House, Konoha";
String tel_Numb = "081-2345678";
String email = "atchaye.apa@student.mahidol.ac.th";

Color headingFontColor = const Color.fromARGB(255, 0, 0, 0);
Color subheadFontColor = const Color.fromARGB(255, 112, 112, 112);
Color iconColor = const Color.fromARGB(255, 24, 22, 58);
Color navyBlue = const Color.fromARGB(255, 25, 23, 97); // For icons,..

// Image img = Image.asset("lib/assets/Background.PNG");

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Project';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      // home: MainClass(),
      home: Login(),
    );
  }
}

// main setup for all pages
class MainClass extends StatefulWidget {
  const MainClass({super.key});

  @override
  State<MainClass> createState() => _MainClassState();
}

class _MainClassState extends State<MainClass> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  late List<Widget> _widgetOptions;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    _widgetOptions = <Widget>[
      Home(_onItemTapped),
      WeatherPage(),
      Profile(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // color: Colors.white.withOpacity(0),
      home: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              constraints: const BoxConstraints.expand(),
              child: Image.asset(
                "assets/Background.PNG",
                fit: BoxFit.fill,
              ),
            ),
            Container(
              color: Colors.white.withOpacity(0),
              child: _widgetOptions.elementAt(_selectedIndex),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.wb_sunny_outlined),
              label: 'Weather',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outlined),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
