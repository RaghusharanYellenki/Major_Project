import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class Payment extends StatefulWidget {
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  Razorpay _razorpay = Razorpay();
  final user = FirebaseAuth.instance.currentUser;

  @required
  void initState(){
    super.initState();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse payS) {
    Fluttertoast.showToast(
        msg: "Payment Successful" + payS.paymentId.toString());
  }

  void _handlePaymentError(PaymentFailureResponse res) {
    Fluttertoast.showToast(
        msg: "You payment has failed and the reason is : " +
            res.code.toString() +
            "-" +
            res.message.toString());
  }

  void _handleExternalWallet(ExternalWalletResponse resp) {
    Fluttertoast.showToast(
        msg: "redirecting to external wallet" + resp.walletName.toString());
  }

  callMonthly() async {
    var options = {
      'key': 'rzp_test_3Z1jhQyaJKtqlW',
      'amount': 4900,
      'name': '${user.displayName}',
      'description': ' for Monthly subscription',
      'prefill': {'contact': '', 'email': '${user.email}'},
      'external': {
        'wallets': ['paytm']
      }
    };
    try {
      _razorpay.open(options);
    } catch (msg) {}
  }

  callYearly() async {
    var options = {
      'key': 'rzp_test_3Z1jhQyaJKtqlW',
      'amount': 49900,
      'name': '${user.displayName}',
      'description': ' for Yearly subscription',
      'prefill': {'contact': '', 'email': '${user.email}'},
      'external': {
        'wallets': ['paytm']
      }
    };
    try {
      _razorpay.open(options);
    } catch (msg) {}
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('Subscription Page'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        color: Colors.blueGrey.shade900,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Subscribe to monthly or yearly',
              style: TextStyle(color: Colors.white, fontSize: 50),
            ),
            SizedBox(height: 12),
            ElevatedButton(
              child: Text(
                'MONTHLY plan at Rs 49/-',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              style: ButtonStyle(
                padding:
                    MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(10)),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.orange.shade900),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      side: BorderSide(color: Colors.white, width: 3)),
                ),
              ),
              onPressed: callMonthly,
            ),
            SizedBox(height: 12),
            ElevatedButton(
              child: Text(
                'YEARLY plan at Rs 499/-',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              style: ButtonStyle(
                padding:
                    MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(10)),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.orange.shade900),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      side: BorderSide(color: Colors.white, width: 3)),
                ),
              ),
              onPressed: callYearly,
            ),
          ],
        ),
      ),
    );
  }
}
