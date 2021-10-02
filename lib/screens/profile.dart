// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Container(
        child: ListView(children: [
          SizedBox(
            height: 20.0,
          ),
          Center(
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 6.5,
                  width: MediaQuery.of(context).size.width / 2,
                  // : 100.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Image.asset("images/profile-inner.png"),
                ),
                Positioned(
                    top: 60.0,
                    // top: 60.0,
                    right: 50,
                    child: Icon(
                      FontAwesomeIcons.camera,
                      color: Colors.indigo,
                    )),
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Center(
            child: Text(
              "Mobile No:- 8434680104",
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Center(
            child: Text(
              "Address",
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            margin: EdgeInsets.only(left: 20.0),
            child: Text(
              "City / Village",
              style: TextStyle(fontSize: 15.0),
            ),
          ),
          Container(
              margin: EdgeInsets.only(left: 20.0, right: 20.0),
              child: TextField()),
          SizedBox(
            height: 10.0,
          ),
          Container(
            margin: EdgeInsets.only(left: 20.0),
            child: Text(
              "District",
              style: TextStyle(fontSize: 15.0),
            ),
          ),
          Container(
              margin: EdgeInsets.only(left: 20.0, right: 20.0),
              child: TextField()),
          SizedBox(
            height: 10.0,
          ),
          Container(
            margin: EdgeInsets.only(left: 20.0),
            child: Text(
              "State",
              style: TextStyle(fontSize: 15.0),
            ),
          ),
          Container(
              margin: EdgeInsets.only(left: 20.0, right: 20.0),
              child: TextField()),
          SizedBox(
            height: 10.0,
          ),
          Container(
            margin: EdgeInsets.only(left: 20.0),
            child: Text(
              "Pin",
              style: TextStyle(fontSize: 15.0),
            ),
          ),
          Container(
              margin: EdgeInsets.only(left: 20.0, right: 20.0),
              child: TextField()),
          SizedBox(
            height: 10.0,
          ),
          Container(
            margin: EdgeInsets.only(left: 20.0),
            child: Text(
              "Email Id",
              style: TextStyle(fontSize: 15.0),
            ),
          ),
          Container(
              margin: EdgeInsets.only(left: 20.0, right: 20.0),
              child: TextField()),
          InkWell(
            child: Container(
              height: 45.0,
              // color: Colors.red,
              decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),

              margin: EdgeInsets.only(
                  top: 15.0, left: 15.0, right: 15.0, bottom: 10.0),
              child: Center(
                  child: Text(
                "Update",
                style: TextStyle(fontSize: 20.0),
              )),
            ),
            onTap: () async {
              // ignore: unnecessary_null_comparison
            },
          ),
        ]),
      ),
    );
  }
}
