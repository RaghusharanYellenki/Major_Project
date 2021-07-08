import 'package:flutter/material.dart';
import 'package:majorproject/page/auth_page.dart';

import 'background_painter.dart';
import 'google_signup_button_widget.dart';

class SignUpWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Stack(
        fit: StackFit.expand,
        children: [
          CustomPaint(painter: BackgroundPainter()),
          buildSignUp(context),
        ],
      );

  Widget buildSignUp(BuildContext context) => Column(
        children: [
          Spacer(),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: 200,
              child: Text(
                'Welcome to NEWSAPP',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Spacer(),
          Text('click to get started'),
          SizedBox(height: 10),
          ElevatedButton(
            child: Text(
                "Lets GO",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 30),
            ),
            style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsets>(
                  EdgeInsets.all(15)),
              foregroundColor:
              MaterialStateProperty.all<Color>(Colors.black),
              backgroundColor:
              MaterialStateProperty.all<Color>(Colors.white),
              shape:
              MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0),
                    side: BorderSide(color: Colors.black54, width: 4)),
              ),
            ),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => AuthPage()),
            ),
          ),
          SizedBox(height: 12),
          GoogleSignupButtonWidget(),
          Spacer()
        ],
      );
}
