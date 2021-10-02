import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:nirmalmarg/screens/sucess.dart';

class SatsangBook extends StatefulWidget {
  SatsangBook({Key? key}) : super(key: key);

  @override
  _SatsangBookState createState() => _SatsangBookState();
}

class _SatsangBookState extends State<SatsangBook> {
  TextEditingController dateController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();
  DateTime _date = DateTime.now();
  final DateFormat dateFormat = DateFormat("dd/MM/yyyy");

  _handerlDatePicker() async {
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (date != null && date != _date) {
      setState(() {
        _date = date;
      });
      dateController.text = dateFormat.format(date);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Satsang Book"),
      ),
      body: Container(
        child: Form(
          key: formGlobalKey,
          child: ListView(
            children: [
              SizedBox(
                height: 20.0,
              ),
              Container(
                margin: EdgeInsets.only(top: 5.0, left: 15.0, right: 15.0),
                child: Center(
                  child: TextFormField(
                    onTap: _handerlDatePicker,
                    controller: dateController,
                    // controller: phoneController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      suffixIcon: Icon(FontAwesomeIcons.calendarAlt),
                      labelText: "Select Date",
                      hintText: "Select Date",

                      // errorText: 'Error Text',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 5.0)),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "* Required";
                      } else
                        return null;
                    },
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
                child: Center(
                  child: TextFormField(
                    controller: nameController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: "Enter Your Name",
                      hintText: "Enter Your Name",
                      // errorText: 'Error Text',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 5.0)),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "* Required";
                      } else
                        return null;
                    },
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
                child: Center(
                  child: TextFormField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: "Enter Your Mobile No",
                      hintText: "Enter Your Mobile No",
                      // errorText: 'Error Text',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 5.0)),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "* Required";
                      } else
                        return null;
                    },
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0),
                child: Center(
                  child: TextFormField(
                    controller: amountController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: "Enter Your Donation Annount",
                      hintText: "Enter Your Donation Annount",
                      // errorText: 'Error Text',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 5.0)),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "* Required";
                      } else
                        return null;
                    },
                  ),
                ),
              ),
              InkWell(
                child: Container(
                  height: 45.0,
                  // color: Colors.red,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),

                  margin: EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
                  child: Center(
                      child: Text(
                    "Pay & Book",
                    style: TextStyle(fontSize: 20.0),
                  )),
                ),
                onTap: () async {
                  if (formGlobalKey.currentState!.validate()) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SucessScreen()));
                  } else {
                    print("Not Validated");
                  }
                },

              ),
            ],
          ),
        ),
      ),
    ));
  }
}
