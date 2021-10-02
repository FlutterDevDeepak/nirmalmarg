import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nirmalmarg/screens/home_page.dart';

class SucessScreen extends StatefulWidget {
  // String name;
  SucessScreen({
    Key? key,
  }) : super(key: key);

  @override
  _SucessScreenState createState() => _SucessScreenState();
}

class _SucessScreenState extends State<SucessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 2.5),
              child: Icon(
                FontAwesomeIcons.checkCircle,
                size: 100.0,
                color: Colors.green,
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Container(
                child: Text(
              "Booking Sucessfully ",
              style: TextStyle(fontSize: 20.0, decoration: TextDecoration.none),
            )),
            SizedBox(
              height: 20.0,
            ),
            InkWell(
              child: Container(
                height: 45.0,
                // color: Colors.red,
                decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),

                margin: EdgeInsets.only(
                    top: 15.0, left: 15.0, right: 15, bottom: 10),
                child: Center(
                    child: Text(
                  "Go Back To Home Screen",
                  style: TextStyle(fontSize: 20.0),
                )),
              ),
              onTap: () async {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
