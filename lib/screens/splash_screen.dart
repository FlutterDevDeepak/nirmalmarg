import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nirmalmarg/screens/home_page.dart';
import 'package:nirmalmarg/screens/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? finalMobile;

  void initState() {
    super.initState();
    getvalidationData().whenComplete(() async {
      Timer(
          Duration(seconds: 3),
          () => Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) =>
                  finalMobile == null ? LoginPage() : HomePage())));
    });
  }

  Future getvalidationData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtainMobile = sharedPreferences.getString("mobile");
    setState(() {
      finalMobile = obtainMobile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text(""),
        // ),
        body: Center(
          child: Image.asset("images/nlogo.png"),
        ),
      ),
    );
  }
}
