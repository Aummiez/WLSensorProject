import 'package:flutter/material.dart';

String username = "Atchaye Apattitetena";
Color headingFontColor = const Color.fromARGB(255, 0, 0, 0);
Color subheadFontColor = const Color.fromARGB(255, 112, 112, 112);
Color iconColor = const Color.fromARGB(255, 24, 22, 58);

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Testing';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final List<Widget> _widgetOptions = <Widget>[
    Home(),
    const Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    const Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.person_rounded),
        title: Container(
          margin: const EdgeInsets.only(top: 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Welcome Home,",
                selectionColor: subheadFontColor,
                textAlign: TextAlign.left,
                style:
                    TextStyle(color: subheadFontColor, height: 2, fontSize: 10),
              ),
              Text(
                username,
                selectionColor: headingFontColor,
                textAlign: TextAlign.left,
                style:
                    TextStyle(color: headingFontColor, height: 1, fontSize: 18),
              ),
            ],
          ),
        ),
        backgroundColor: const Color.fromRGBO(255, 255, 255, 0),
        actions: [
          Container(
            margin: const EdgeInsets.all(5.0),
            child: Row(
              children: const [
                Icon(Icons.notifications,
                    color: Color.fromARGB(255, 30, 29, 67)),
                Icon(
                  Icons.add_box,
                  color: Color.fromARGB(255, 30, 29, 67),
                ),
              ],
            ),
          )
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wb_sunny_outlined),
            label: 'Smart',
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
    );
  }
}

class Home extends StatelessWidget {
  // const MyApp({super.key});

  static const String _title = 'Head of Home';

  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application name
      title: _title,
      theme: ThemeData(
          // primarySwatch: const Colors.white,
          // useMaterial3: true,
          ),
      home: MyStatelessWidget(),
    );
  }
}

class ClassName extends StatelessWidget {
  const ClassName({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.person_rounded),
        title: Container(
          margin: const EdgeInsets.only(top: 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Welcome Home,",
                selectionColor: subheadFontColor,
                textAlign: TextAlign.left,
                style:
                    TextStyle(color: subheadFontColor, height: 2, fontSize: 10),
              ),
              Text(
                username,
                selectionColor: headingFontColor,
                textAlign: TextAlign.left,
                style:
                    TextStyle(color: headingFontColor, height: 1, fontSize: 18),
              ),
            ],
          ),
        ),
        backgroundColor: const Color.fromRGBO(255, 255, 255, 0),
        actions: [
          Container(
            margin: const EdgeInsets.all(5.0),
            child: Row(
              children: const [
                Icon(Icons.notifications,
                    color: Color.fromARGB(255, 30, 29, 67)),
                Icon(
                  Icons.add_box,
                  color: Color.fromARGB(255, 30, 29, 67),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({super.key});

  // const MyStatelessWidget({super.key});
  //

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Container(),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                text: "All Sensor",
              ),
              Tab(
                text: "PM 2.5",
              ),
              Tab(
                text: "Temperature",
              ),
              Tab(
                text: "Humidity",
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            Center(
              child: MyHomePage(title: 'Tab one'),
            ),
            Center(
              child: SecPage(title: 'Tab two'),
            ),
            Center(
              child: Text("It's sunny here"),
            ),
            Center(
              child: Text("It's sunny here"),
            ),
          ],
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [],
        ),
      ),
    );
  }
}

class SecPage extends StatelessWidget {
  final String title;
  const SecPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const <Widget>[],
    );
  }
}
