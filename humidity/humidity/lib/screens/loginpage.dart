import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:humidity/main.dart';
import 'package:humidity/screens/homepage.dart';
import 'package:humidity/screens/signuppage.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        Center(
          child: Container(
            margin: EdgeInsets.only(left: 40, right: 40, top: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Sign in",
                  style: TextStyle(
                    fontSize: 36,
                    color: Color.fromARGB(255, 40, 40, 40),
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Enter Your Email and Password",
                  style: TextStyle(
                    // fontSize: 36,
                    color: Color.fromARGB(255, 144, 144, 144),
                    fontFamily: 'Nunito',
                    // fontWeight: FontWeight.bold,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 60),
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 0),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Email',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 0),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Password',
                            ),
                          ),
                        ),
                      ]),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromARGB(255, 40, 40, 40)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(
                                color: Color.fromARGB(255, 40, 40, 40),
                              ),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return MainClass();
                          }));
                        },
                        child: Text(
                          "LOGIN",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20, bottom: 25),
                      // alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account?"),
                          TextButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return SignUp();
                              }));
                            },
                            child: Text(
                              "Sign up",
                              // textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.blueAccent,
                                // fontSize: 11,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),

                    Row(children: <Widget>[
                      Expanded(
                        child: new Container(
                            margin:
                                const EdgeInsets.only(left: 10.0, right: 15.0),
                            child: Divider(
                              color: Color.fromARGB(255, 40, 40, 40),
                              height: 50,
                            )),
                      ),
                      Text("Sign in with"),
                      Expanded(
                        child: new Container(
                            margin:
                                const EdgeInsets.only(left: 15.0, right: 10.0),
                            child: Divider(
                              color: Color.fromARGB(255, 40, 40, 40),
                              height: 50,
                            )),
                      ),
                    ]),
                    Row(), //Picture of Social apps here
                    TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return MainClass();
                        }));
                      },
                      child: Text(
                        "Skip for now",
                        // textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromARGB(255, 176, 176, 176),
                          fontSize: 14,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
