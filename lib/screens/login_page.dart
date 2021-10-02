import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:nirmalmarg/constant/colors_const.dart';
import 'package:http/http.dart' as http;
import 'package:nirmalmarg/screens/home_page.dart';
// import 'package:nirmalmarg/screens/home_page.dart';
import 'package:nirmalmarg/screens/validate_otp.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _loginFormKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  TextEditingController otpCotroller = TextEditingController();
  late String mobileNumber;
  late String mobileNumbers;
  bool _btnPressed = false;
  bool isLoggedIn = false;
  bool otpSent = false;
  late String uid;
  late String _verificationId;

  @override
  void initState() {
    super.initState();
    // bool _btnPressed = false;
  }

  generateOtp() async {
    mobileNumber = phoneController.text.toString();
    http.Response response = await http.post(Uri.parse(
        'https://admin.nirmalmarg.org/api/v1/generateOTP?mobile=$mobileNumber'));
    // return response;
    if (response.statusCode == 200) {
      Fluttertoast.showToast(msg: "OTP sent Sucessfully on $mobileNumber");
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ValidateOtPScreen(
                  mobileNumbers: phoneController.text.toString())));
    }
  }

  sentOtp() async {
    mobileNumber = phoneController.text;
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "+91$mobileNumber",
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
    Fluttertoast.showToast(
      msg: "Please Wait OTP is being sent ",
    );
  }

  verificationFailed(FirebaseAuthException exception) {
    print(exception.message);
    setState(() {
      isLoggedIn = false;
      otpSent = false;
    });
  }

  codeAutoRetrievalTimeout(String verificationId) {
    setState(() {
      _verificationId = verificationId;

      otpSent = true;
    });
  }

  codeSent(String verificationId, [int? a]) {
    setState(() {
      _verificationId = verificationId;
      otpSent = true;
    });
  }

  verificationCompleted(PhoneAuthCredential credential) async {
    await FirebaseAuth.instance.signInWithCredential(credential);
    if (FirebaseAuth.instance.currentUser != null) {
      setState(() {
        isLoggedIn = true;
        uid = FirebaseAuth.instance.currentUser!.uid;
      });
    } else {
      print("Failed to Sign In");
    }
  }

  verifyOtp() async {
    final credential = PhoneAuthProvider.credential(
      verificationId: _verificationId,
      smsCode: otpCotroller.text,
    );

    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
      Fluttertoast.showToast(msg: "Otp matches Sucessfully");
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString('mobile', phoneController.text);
      if (FirebaseAuth.instance.currentUser != null) {
        setState(() async {
          uid = FirebaseAuth.instance.currentUser!.uid;
        });
      }
    } catch (e) {
      print(e);
    }
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Container(
          // color: kBlack,
          child: Form(
            child: ListView(
              children: [
                SizedBox(
                  height: 60.0,
                ),
                Container(
                    height: MediaQuery.of(context).size.height / 3.5,
                    width: MediaQuery.of(context).size.width / 2,
                    child: Image.asset("images/nlogo.png")),
                Center(
                  child: Container(
                    child: Text(
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
                          fontSize: 18.0, fontWeight: FontWeight.w500),
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
                    child: TextFormField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: "Enter Your Mobile Number ",
                        hintText: 'Enter Your Mobile Number ',
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
                otpSent
                    ? Center(
                        child: Container(
                          // height: 10,
                          child: Text(
                            "Otp Sent Sucessfully on ${phoneController.text}",
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Colors.red,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      )
                    : InkWell(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 20),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            color: Colors.red,
                            child: Center(
                                child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "GENERATE OTP",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w500),
                              ),
                            )),
                          ),
                        ),
                        onTap: () async {
                          if (phoneController.text.isEmpty) {
                            Fluttertoast.showToast(
                                msg: "Please Enter correcct Mobile Number ");
                          } else {
                            sentOtp();
                          }
                        },
                      ),
                otpSent
                    ? Column(
                        children: [
                          SizedBox(
                            height: 16.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 20),
                            child: Center(
                              child: TextFormField(
                                controller: otpCotroller,
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  labelText: "Enter Your Otp Number ",
                                  hintText: 'Enter Your Otp Number',
                                  // errorText: 'Error Text',
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.red, width: 5.0)),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          InkWell(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 20),
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
                              if (otpCotroller.text.isEmpty) {
                                Fluttertoast.showToast(
                                    msg: "Please Enter correcct Oto Number ");
                              } else {
                                verifyOtp();
                              }
                            },
                          ),
                        ],
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
