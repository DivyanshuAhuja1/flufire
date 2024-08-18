import 'dart:async';
import 'package:flutter/material.dart';
import 'package:science_new/screens/dashboard.dart';
import '../userlogin/signin.dart';


class LoggedSplash extends StatefulWidget {
  @override
  State<LoggedSplash> createState() => _LoggedSplashState();
}

class _LoggedSplashState extends State<LoggedSplash> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => Dashboard()
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white, // Set the background color to white
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Image.asset(
                'assets/abcd.png',
                height: 150,
                width: 150,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
