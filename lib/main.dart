import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nirmalmarg/screens/splash_screen.dart';
import 'package:nirmalmarg/screens/sucess.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nirmal Marg',
      darkTheme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.black,
        brightness: Brightness.dark,
        accentColor: Colors.white,
        accentIconTheme: IconThemeData(color: Colors.black),
        dividerColor: Colors.black12,
        scaffoldBackgroundColor: Color(0xFF131313),
      ),
      home: SplashScreen(),
      // home: SucessScreen(),
    );
  }
}
