import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
// import 'package:nirmalmarg/constant/colors_const.dart';
import 'package:nirmalmarg/screens/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ValidateOtPScreen extends StatefulWidget {
  String mobileNumbers;
  ValidateOtPScreen({Key? key, required this.mobileNumbers}) : super(key: key);

  @override
  _ValidateOtPScreenState createState() => _ValidateOtPScreenState();
}

class _ValidateOtPScreenState extends State<ValidateOtPScreen> {
  var _loginFormKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  late String mobileNumber;
  late String otp;
  var res;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  validateOtp() async {
    otp = otpController.text.toString();
    mobileNumber = widget.mobileNumbers.toString();
    http.Response response = await http.post(Uri.parse(
        'https://admin.nirmalmarg.org/api/v1/verifyOTP?mobile=$mobileNumber&otp=$otp'));

    res = jsonDecode(response.body);

    print(res);
    // return response;
    if (res["reason"] == "OTP mismatch") {
      Fluttertoast.showToast(msg: "Otp not mateches Please Enter Valid Otp");
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
      Fluttertoast.showToast(msg: "Otp matches Sucessfully");
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString('mobile', phoneController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          // backgroundColor: kBlack,
          elevation: 0.0,
          title: Text("OTP Verification"),
        ),
        body: Container(
          // color: kBlack,
          child: Form(
            child: ListView(
              children: [
                Container(
                    height: MediaQuery.of(context).size.height / 3.5,
                    width: MediaQuery.of(context).size.width / 2,
                    child: Image.asset("images/nlogo.png")),
                Center(
                  child: Container(
                    child: Text(
                      // mobileNumbers
                      "Nirmal Marg",
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          // color: Colors.white,
                          fontSize: 22.0,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Center(
                  child: Container(
                    child: Text(
                      "Please provide your Mobile Number to \n                 access our system ",
                      style: TextStyle(
                          // fontStyle: FontStyle.italic,
                          // color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  child: Center(
                    // child: Text("$mobileNumber"),
                    child: TextFormField(
                      // controller: phoneController,
                      initialValue: widget.mobileNumbers.toString(),

                      // onChanged: (value) {
                      //   value = widget.mobileNumbers;
                      // },
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: "Enter Your Mobile Number",
                        hintText: 'Enter Your Mobile Number',
                        // errorText: 'Error Text',
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 5.0)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  child: Center(
                    child: TextFormField(
                      controller: otpController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: "Enter Your OTP",
                        hintText: 'Enter Your OTP',
                        // errorText: 'Error Text',
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.red, width: 5.0)),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                InkWell(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.red,
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Verify & Login",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500),
                        ),
                      )),
                    ),
                  ),
                  onTap: () async {
                    validateOtp();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
