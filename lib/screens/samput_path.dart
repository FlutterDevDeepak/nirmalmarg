import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:nirmalmarg/screens/sucess.dart';

class SamputhPath extends StatefulWidget {
  SamputhPath({Key? key}) : super(key: key);

  @override
  _SamputhPathState createState() => _SamputhPathState();
}

class _SamputhPathState extends State<SamputhPath> {
  TextEditingController dateController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController fnameController = TextEditingController();
  TextEditingController mnameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController ardasController = TextEditingController();
  TextEditingController distController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController villageController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController amountController = TextEditingController();
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
        title: Text("Book Samputh Path"),
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
                          borderSide:
                              BorderSide(color: Colors.red, width: 5.0)),
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
                    controller: nameController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Enter Your Name",
                      hintText: "Enter Your Name",
                      // errorText: 'Error Text',
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.red, width: 5.0)),
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
                    controller: fnameController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Enter Your Father's Name",
                      hintText: "Enter Your Father's Name",
                      // errorText: 'Error Text',
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.red, width: 5.0)),
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
                    controller: mnameController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Enter Your Mother's Name",
                      hintText: "Enter Your Mother's Name",
                      // errorText: 'Error Text',
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.red, width: 5.0)),
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
                    controller: mobileController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: "Enter Your Mobile No",
                      hintText: "Enter Your Mobile No",
                      // errorText: 'Error Text',
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.red, width: 5.0)),
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
                    controller: ardasController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "ARDAS",
                      hintText: "ARDAS",
                      // errorText: 'Error Text',
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.red, width: 5.0)),
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
                    controller: distController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "District",
                      hintText: "District",
                      // errorText: 'Error Text',
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.red, width: 5.0)),
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
                    controller: stateController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "State",
                      hintText: "State",
                      // errorText: 'Error Text',
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.red, width: 5.0)),
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
                    controller: villageController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Village",
                      hintText: "Village",
                      // errorText: 'Error Text',
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.red, width: 5.0)),
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
                    controller: pincodeController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: "Pin Code",
                      hintText: "Pin Code",
                      // errorText: 'Error Text',
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.red, width: 5.0)),
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
                    controller: amountController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: "Enter your Ammount",
                      hintText: "Enter your Ammount",
                      // errorText: 'Error Text',
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.red, width: 5.0)),
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
                  margin: EdgeInsets.only(
                      top: 15.0, left: 15.0, right: 15, bottom: 10),
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
