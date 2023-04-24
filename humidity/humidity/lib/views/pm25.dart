import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

// double pm25Data = 120; //value for PM2.5
Query ref1 = FirebaseDatabase.instance.ref().child('AirPollution').child('pm1');
Query ref2_5 =
    FirebaseDatabase.instance.ref().child('AirPollution').child('pm2_5');
Query ref10 =
    FirebaseDatabase.instance.ref().child('AirPollution').child('pm10');

List<Query> ref = [ref1, ref2_5, ref10];

String dataPM1 = '';
String dataPM2_5 = '';
String dataPM10 = '';

Color pmColor(double value) {
  // for PM2.5 (micrograms/m^2)
  if (value <= 12.0) {
    // Good
    return Colors.blueAccent;
  } else if (value <= 35.4) {
    // Moderate
    return Colors.green;
  } else if (value <= 55.4) {
    // Moderate
    return Color.fromARGB(255, 220, 198, 6);
  } else if (value <= 150.4) {
    // Moderate
    return Colors.red;
  } else if (value <= 250.4) {
    // Moderate
    return const Color.fromARGB(255, 114, 21, 131);
  } else {
    return const Color.fromARGB(255, 67, 9, 53);
  }
  // Hazardous
}

Color subheadFontColor = const Color.fromARGB(255, 112, 112, 112);

class PM25 extends StatelessWidget {
  final String title;
  const PM25({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          margin: EdgeInsets.only(top: 30, left: 50, right: 50),
          child: GridView.count(
            primary: false,
            // padding:
            //     const EdgeInsets.all(2),
            crossAxisSpacing: 10,
            mainAxisSpacing: 20,
            crossAxisCount: 1,
            children: [
              SafeArea(
                // pm 1
                child: FutureBuilder<DatabaseEvent>(
                  future: ref1.once(),
                  builder: (BuildContext context,
                      AsyncSnapshot<DatabaseEvent> snapshot) {
                    if (snapshot.hasData) {
                      dynamic pm1 = snapshot.data!.snapshot.value ??
                          [0]; // Get the first item from the list
                      dataPM1 = pm1.toString();
                      return Container(
                          // height: 200,
                          // width: 200,
                          // padding: EdgeInsets.only(left: 10),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: pmColor(double.parse(dataPM1)),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "pm 1",
                                style: const TextStyle(
                                    color: Colors.white60, fontSize: 22),
                              ),
                              Text(
                                dataPM1,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 100),
                              ),
                            ],
                          ));
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
              SafeArea(
                // pm 1
                child: FutureBuilder<DatabaseEvent>(
                  future: ref2_5.once(),
                  builder: (BuildContext context,
                      AsyncSnapshot<DatabaseEvent> snapshot) {
                    if (snapshot.hasData) {
                      dynamic pm2_5 = snapshot.data!.snapshot.value ??
                          [0]; // Get the first item from the list
                      dataPM2_5 = pm2_5.toString();
                      return Container(
                          height: 200,
                          width: 200,
                          // padding: EdgeInsets.only(left: 10),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: pmColor(double.parse(dataPM2_5)),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "pm 2.5",
                                style: const TextStyle(
                                    color: Colors.white60, fontSize: 22),
                              ),
                              Text(
                                dataPM2_5,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 100),
                              ),
                            ],
                          ));
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
              SafeArea(
                // pm 1
                child: FutureBuilder<DatabaseEvent>(
                  future: ref10.once(),
                  builder: (BuildContext context,
                      AsyncSnapshot<DatabaseEvent> snapshot) {
                    if (snapshot.hasData) {
                      dynamic pm10 = snapshot.data!.snapshot.value ??
                          [0]; // Get the first item from the list
                      dataPM10 = pm10.toString();
                      return Container(
                          height: 200,
                          width: 200,
                          // padding: EdgeInsets.only(left: 10),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: pmColor(double.parse(dataPM10)),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "pm 10",
                                style: const TextStyle(
                                    color: Colors.white60, fontSize: 22),
                              ),
                              Text(
                                dataPM10,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 100),
                              ),
                            ],
                          ));
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
