import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:razorpay_flutter/razorpay_flutter.dart';

class DonationPage extends StatefulWidget {
  DonationPage({Key? key}) : super(key: key);

  @override
  _DonationPageState createState() => _DonationPageState();
}

class _DonationPageState extends State<DonationPage> {
  TextEditingController amountController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();
  late Razorpay _razorpay;
  var res;
  var transaction_id;

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
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
      'description': 'Donation',
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
        Uri.parse('https://admin.nirmalmarg.org/api/v1/saveDonation'),
        body: {
          "name": nameController.text,
          "amount": amountController.text,
          "phone": phoneController.text,
          "txn_id": transaction_id.toString(),
          "payment_status": "Sucess",
        });
    print(responseapi.body);
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
        title: Text("Donation"),
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
                    controller: amountController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Enter Your Donation Annount",
                      hintText: "Enter Your Donation Annount",
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
              InkWell(
                  child: Container(
                    // width: size,
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
