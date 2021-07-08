import 'package:flutter/material.dart';

class Appdetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text("App Details"),
      ),
      body: Container(
        color: Colors.blueGrey.shade900,
        child: Center(
          child: Column(
            children: [
              Text(
                'Dependencies used:',
                style: TextStyle(color: Colors.white,fontSize: 30),
              ),
              SizedBox(height: 15),
              Column(
                children: [
                  Text('fluttertoast:',
                    style: TextStyle(color: Colors.white,fontSize: 25),
                  ),
                  Text('cupertino_icons:',
                    style: TextStyle(color: Colors.white,fontSize: 25),
                  ),
                  Text('firebase_auth:',
                    style: TextStyle(color: Colors.white,fontSize: 25),
                  ),
                  Text('firebase_core:',
                    style: TextStyle(color: Colors.white,fontSize: 25),
                  ),
                  Text('flutter_signin_button:',
                    style: TextStyle(color: Colors.white,fontSize: 25),
                  ),
                  Text('google_sign_in:',
                    style: TextStyle(color: Colors.white,fontSize: 25),
                  ),
                  Text('http:',
                    style: TextStyle(color: Colors.white,fontSize: 25),
                  ),
                  Text('cached_network_image:',
                    style: TextStyle(color: Colors.white,fontSize: 25),
                  ),
                  Text('webview_flutter:',
                    style: TextStyle(color: Colors.white,fontSize: 25),
                  ),
                  Text('expandable_text:',
                    style: TextStyle(color: Colors.white,fontSize: 25),
                  ),
                  Text('razorpay_flutter:',
                    style: TextStyle(color: Colors.white,fontSize: 25),
                  ),
                  Text('provider:',
                    style: TextStyle(color: Colors.white,fontSize: 25),
                  ),
                  Text('font_awesome_flutter:',
                    style: TextStyle(color: Colors.white,fontSize: 25),
                  ),
                  Text('flutter_launcher_icons:',
                    style: TextStyle(color: Colors.white,fontSize: 25),
                  ),
                  Text('flutter_icons:',
                    style: TextStyle(color: Colors.white,fontSize: 25),
                  ),
                  SizedBox(height: 10),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
