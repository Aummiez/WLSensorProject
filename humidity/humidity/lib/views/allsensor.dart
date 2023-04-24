import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

Color blueWidget = Color.fromARGB(255, 8, 34, 49); // For icons,..

class AllSensor extends StatelessWidget {
  final String title;
  const AllSensor({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          margin: EdgeInsets.only(top: 150, left: 10, right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Container(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // color: Colors.transparent,
                    margin: EdgeInsets.only(bottom: 20),
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      color: blueWidget,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black38,
                          blurRadius: 2.0,
                          // spreadRadius: 25,
                          offset: Offset(
                            0,
                            2,
                          ),
                        )
                      ],
                    ),
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: EdgeInsets.only(
                        left: 10,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Icon(
                              Icons.smart_button,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "Air Purifier",
                            // textScaleFactor: 2,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20),
                          ),
                          Text(
                            "1 device",
                            // textScaleFactor: 2,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 170, 170, 170),
                                fontSize: 10),
                          ),
                          GFToggle(
                            onChanged: (val) {},
                            value: true,
                            // enabledThumbColor: Colors.red,
                            type: GFToggleType.ios,
                            disabledText: "Off",
                            enabledText: "On",
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    // color: Colors.transparent,
                    margin: EdgeInsets.only(bottom: 20),
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black38,
                          blurRadius: 2.0,
                          // spreadRadius: 25,
                          offset: Offset(
                            0,
                            2,
                          ),
                        )
                      ],
                    ),
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: EdgeInsets.only(
                        left: 10,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: blueWidget.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Icon(
                              Icons.vertical_split,
                              color: blueWidget,
                            ),
                          ),
                          Text(
                            "PM 2.5",
                            // textScaleFactor: 2,
                            style: const TextStyle(
                              // color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "1 device",
                            // textScaleFactor: 2,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 170, 170, 170),
                                fontSize: 10),
                          ),
                          GFToggle(
                            onChanged: (val) {},
                            value: true,
                            // enabledThumbColor: Colors.red,
                            type: GFToggleType.ios,
                            disabledText: "Off",
                            enabledText: "On",
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // color: Colors.transparent,
                    margin: EdgeInsets.only(bottom: 20),
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black38,
                          blurRadius: 2.0,
                          // spreadRadius: 25,
                          offset: Offset(
                            0,
                            2,
                          ),
                        )
                      ],
                    ),
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: EdgeInsets.only(
                        left: 10,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: blueWidget.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Icon(
                              Icons.heat_pump_rounded,
                              color: blueWidget,
                            ),
                          ),
                          Text(
                            "Temperature",
                            // textScaleFactor: 2,
                            style: const TextStyle(
                              // color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "1 device",
                            // textScaleFactor: 2,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 170, 170, 170),
                                fontSize: 10),
                          ),
                          GFToggle(
                            onChanged: (val) {},
                            value: true,
                            // enabledThumbColor: Colors.red,
                            type: GFToggleType.ios,
                            disabledText: "Off",
                            enabledText: "On",
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    // color: Colors.transparent,
                    margin: EdgeInsets.only(bottom: 20),
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black38,
                          blurRadius: 2.0,
                          // spreadRadius: 25,
                          offset: Offset(
                            0,
                            2,
                          ),
                        )
                      ],
                    ),
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: EdgeInsets.only(
                        left: 10,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: blueWidget.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Icon(
                              Icons.water_drop,
                              color: blueWidget,
                            ),
                          ),
                          Text(
                            "Humidity",
                            // textScaleFactor: 2,
                            style: const TextStyle(
                              // color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "1 device",
                            // textScaleFactor: 2,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 170, 170, 170),
                                fontSize: 10),
                          ),
                          GFToggle(
                            onChanged: (val) {},
                            value: true,
                            // enabledThumbColor: Colors.red,
                            type: GFToggleType.ios,
                            disabledText: "Off",
                            enabledText: "On",
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
