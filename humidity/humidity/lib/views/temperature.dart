import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/widgets.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

double temperatureData = 25; // value for temperature
Query ref = FirebaseDatabase.instance.ref().child('DHT').child('temperature');
Color subheadFontColor = const Color.fromARGB(255, 112, 112, 112);

class Temperature extends StatelessWidget {
  final String title;
  const Temperature({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: FutureBuilder<DatabaseEvent>(
          future: ref.once(),
          builder:
              (BuildContext context, AsyncSnapshot<DatabaseEvent> snapshot) {
            if (snapshot.hasData) {
              dynamic humTemp = snapshot.data!.snapshot.value ??
                  [0]; // Get the first item from the list
              return Center(
                child: Container(
                  // margin: EdgeInsets.only(top: 100),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Text("data of temperature here"),
                      Center(
                        child: Text(
                          humTemp.toString(),
                          // textScaleFactor: 2,
                          style:
                              TextStyle(color: subheadFontColor, fontSize: 100),
                        ),
                      ),

                      Center(
                        child: Text(
                          "degree C",
                          style:
                              TextStyle(color: subheadFontColor, fontSize: 18),
                        ),
                      ),

                      Center(
                        child: Text(
                          "Temperature",
                          textScaleFactor: 2,
                          style: TextStyle(
                            color: subheadFontColor,
                            // fontStyle:
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return const Center(
                // child: CircularProgressIndicator(),
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
