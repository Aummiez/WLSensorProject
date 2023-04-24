import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/widgets.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

Query ref = FirebaseDatabase.instance.ref().child('DHT').child('humidity');

class Humidity extends StatelessWidget {
  final String title;
  const Humidity({Key? key, required this.title}) : super(key: key);

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
                  alignment: Alignment.center,
                  // margin: EdgeInsets.only(top: 200),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SleekCircularSlider(
                        appearance: CircularSliderAppearance(
                          size: 225,
                          customColors: CustomSliderColors(
                            trackColor: Color.fromARGB(255, 194, 194, 194),
                            progressBarColor: Color.fromARGB(255, 30, 156, 239),
                            shadowColor: Color.fromARGB(255, 224, 224, 224),
                          ),
                        ),
                        min: 0,
                        max: 100,
                        initialValue: humTemp,
                      ),
                      Center(
                        child: Text(
                          "Humidity",
                          style: TextStyle(
                            color: const Color.fromARGB(255, 112, 112, 112),
                            fontSize: 24,
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
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
