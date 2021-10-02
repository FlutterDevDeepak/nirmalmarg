import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:nirmalmarg/constant/colors_const.dart';
import 'package:nirmalmarg/screens/akhand_path.dart';
import 'package:nirmalmarg/screens/daswand.dart';
import 'package:nirmalmarg/screens/donation.dart';
import 'package:nirmalmarg/screens/home_page.dart';
import 'package:nirmalmarg/screens/login_page.dart';
import 'package:nirmalmarg/screens/marriage_book.dart';
import 'package:nirmalmarg/screens/profile.dart';
import 'package:nirmalmarg/screens/sahaj_path.dart';
import 'package:nirmalmarg/screens/samput_path.dart';
import 'package:nirmalmarg/screens/satsang_book.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget myDrawer(BuildContext context) {
  return Container(
    // color: kBlack,
    width: 280.0,
    child: Drawer(
      child: Container(
        // color: kBlack,
        child: ListView(
          children: [
            Container(
              child: UserAccountsDrawerHeader(
                accountName: Text("Welcome To"),
                accountEmail: Text("Nirmal Marg"),
                currentAccountPicture: Image.asset(
                  "images/nlogo.png",
                ),
              ),
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.home),
              title: Text("Home"),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.prayingHands),
              title: Text("Akhand Path"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AkhandPath()));
              },
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.prayingHands),
              title: Text("Sahaj Path"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SahajPath()));
              },
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.prayingHands),
              title: Text("Samputh path"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SamputhPath()));
              },
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.prayingHands),
              title: Text("Daswand"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DasWand()));
              },
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.donate),
              title: Text("Donation"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DonationPage()));
              },
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.prayingHands),
              title: Text("Satsang Book"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SatsangBook()));
              },
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.handshake),
              title: Text("Marriage Book"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MarriageBook()));
              },
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.calendarCheck),
              title: Text("Events"),
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.handshake),
              title: Text("Join Us"),
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.idCard),
              title: Text("Profile"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfilePage()));
              },
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.signOutAlt),
              title: Text("LogOut"),
              onTap: () {
                showAlertDialog(context);
              },
            ),
          ],
        ),
      ),
    ),
  );
}

showAlertDialog(BuildContext context) {
  // set up the buttons
  Widget cancelButton = TextButton(
      child: Text("No"),
      onPressed: () {
        Navigator.pop(context);
      });
  Widget continueButton = TextButton(
    child: Text("Yes"),
    onPressed: () async {
      await FirebaseAuth.instance.signOut();
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      // sharedPreferences.remove("email");
      sharedPreferences.clear();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Icon(
      Icons.logout,
      size: 30.0,
    ),
    content: Text("Are you sure want to log out?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
