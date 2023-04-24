import 'package:flutter/material.dart';

String username = "Atchaye Apattitetena";
String location = "Hyuga House, Konoha";
String tel_Numb = "081-2345678";
String email = "atchaye.apa@student.mahidol.ac.th";

double pm25Data = 16; //value for PM2.5
Color headingFontColor = const Color.fromARGB(255, 0, 0, 0);
Color subheadFontColor = const Color.fromARGB(255, 112, 112, 112);

class Profile extends StatelessWidget {
  // const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // debugShowMaterialGrid: false,
      backgroundColor: Colors.transparent,
      // Application name
      body: Center(
        child: Container(
          color: Colors.transparent,
          margin: const EdgeInsets.only(top: 80),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 60,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Edit Picture",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 11,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              Divider(
                thickness: 2,
              ),
              Container(
                margin: const EdgeInsets.only(top: 15),
                padding: EdgeInsets.only(left: 40.0),
                // alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: ,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Name:",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: subheadFontColor,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "Location:",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: subheadFontColor,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "Tel.:",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: subheadFontColor,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "Email:",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: subheadFontColor,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            username,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: headingFontColor,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            location,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: headingFontColor,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            tel_Numb,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: headingFontColor,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            email,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: headingFontColor,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
