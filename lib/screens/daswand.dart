import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:http/http.dart' as http;

class DasWand extends StatefulWidget {
  DasWand({Key? key}) : super(key: key);

  @override
  _DasWandState createState() => _DasWandState();
}

class _DasWandState extends State<DasWand> {
  TextEditingController amountController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController fnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController ardasController = TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();
  late Razorpay _razorpay;
  var res;
  var transaction_id;

  @override
  void initState() {
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void openCheckout() async {
    var options = {
      'key': 'rzp_live_qCl9Xxff3jhkTH', //live
      // 'key': 'rzp_test_NNbwJ9tmM0fbxj', //test
      'amount': num.parse(amountController.text.trim()) * 100,
      'name': nameController.text,
      'description': 'Dashwand',
      'prefill': {
        'contact': phoneController.text.toString(),
        'email': 'test@razorpay.com'
      },
      // 'external': {
      //   'wallets': ['paytm']
      // }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      print(e);
    }
  }

  sendData() async {
    http.Response responseapi = await http.post(
        Uri.parse('https://admin.nirmalmarg.org/api/v1/saveDaswand'),
        body: {
          "name": nameController.text,
          "fathersname": fnameController.text,
          "amount": amountController.text,
          "phone": phoneController.text,
          "ardas": ardasController.text,
          "txn_id": transaction_id.toString(),
          "payment_status": "Sucess",
        });
    if (responseapi.statusCode == 200) {
      Fluttertoast.showToast(
        msg: "SUCCESS: " + transaction_id.toString(),
        toastLength: Toast.LENGTH_SHORT,
      );
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    sendData();
    transaction_id = response.paymentId!;

    print(response);

    // res = response.orderI  d;
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "ERROR: " + response.code.toString() + " - " + response.message!,
        toastLength: Toast.LENGTH_SHORT);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName!,
        toastLength: Toast.LENGTH_SHORT);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Daswand"),
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
                    controller: phoneController,
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
                    keyboardType: TextInputType.phone,
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

                    margin: EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
                    child: Center(
                        child: Text(
                      "Pay",
                      style: TextStyle(fontSize: 20.0),
                    )),
                  ),
                  onTap: () {
                    if (formGlobalKey.currentState!.validate()) {
                      openCheckout();
                    } else {
                      print("Not Validated");
                    }
                  }),
            ],
          ),
        ),
      ),
    ));
  }
}
