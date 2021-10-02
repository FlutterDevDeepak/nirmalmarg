import 'package:flutter/material.dart';
import 'package:nirmalmarg/constant/my_drwer.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(
            title: Text("Niraml Marg"),
          ),
          drawer: myDrawer(context),
          body: Container(
            child: Center(
                child: Text(
              "Welcome to Nirmal Marg",
              style: TextStyle(fontSize: 20.0),
            )),
          ) // Cbody: ,
          ),
    );
  }
}
