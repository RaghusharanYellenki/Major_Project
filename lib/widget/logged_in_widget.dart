import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:majorproject/details/APIdetails.dart';
import 'package:majorproject/details/about.dart';
import 'package:majorproject/details/account.dart';
import 'package:majorproject/details/appdetails.dart';
import 'package:majorproject/details/payment.dart';
import 'package:majorproject/provider/google_sign_in.dart';
import 'package:majorproject/views/homenews.dart';
import 'package:provider/provider.dart';

class LoggedInWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.orangeAccent.shade700),
              child: Stack(
                children: <Widget>[
                  Center(
                    child: Positioned(
                      // right: 50,
                      // top: 20,
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.person,
                              color: Colors.white, size: 50.0),
                          Text(
                            user.displayName,
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                                color: Colors.black),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 30,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Accountpage()),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 5,
            ),
            ListTile(
              leading: Icon(Icons.person_pin_rounded),
              title: Text('Account Details'),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Accountpage()),
                ),
              },
            ),
            Divider(
              height: 5,
            ),
            ListTile(
              leading: Icon(Icons.attach_money_sharp),
              title: Text('Subscription'),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Payment()),
                ),
              },
            ),
            Divider(
              height: 5,
            ),
            ListTile(
              leading: Icon(Icons.system_update_alt_sharp),
              title: Text('Documentation'),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Documentation()),
                ),
              },
            ),
            Divider(
              height: 5,
            ),
            ListTile(
              leading: Icon(Icons.developer_board),
              title: Text('Developer'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => About()),
                );
              },
            ),
            Divider(
              height: 5,
            ),
            ListTile(
              leading: Icon(Icons.app_registration),
              title: Text('App Details'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Appdetails()),
                );
              },
            ),
            Divider(
              height: 8,
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text(
                        'Are you sure you want to logout',
                        textAlign: TextAlign.center,
                      ),
                      actions: <Widget>[
                        ElevatedButton(
                          onPressed: () {
                            final provider = Provider.of<GoogleSignInProvider>(
                                context,
                                listen: false);
                            provider.logout();
                          },
                          child: Text('yes'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Cancel'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
      appBar: new AppBar(
        title: Text('Welcome To NEWSAPP'),
        backgroundColor: Colors.lightBlue.shade500,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.blueGrey.shade900,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 150),
                Text(
                  'WELCOME',
                  style: TextStyle(color: Colors.white,fontSize: 50),
                ),
                SizedBox(height: 8),
                  Text(
                    user.displayName,
                    style: TextStyle(color: Colors.white,fontSize: 40),
                  ),
                SizedBox(height: 8),
                Text(
                    'your registered email is ',
                  style: TextStyle(color: Colors.white,fontSize: 30),
                ),
                SizedBox(height: 8),
                Text(
                  user.email,
                  style: TextStyle(color: Colors.white,fontSize: 25),
                ),
                SizedBox(height: 12),
                ElevatedButton(
                  child: Text(
                      'check latest NEWS',
                    style: TextStyle(color: Colors.white,fontSize: 30),
                  ),
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.all(10)),
                    foregroundColor:
                    MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.orange.shade900),
                    shape:
                    MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          side: BorderSide(color: Colors.white, width: 3)),
                    ),
                  ),
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Homenews()),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    final provider = Provider.of<GoogleSignInProvider>(context,
                        listen: false);
                    provider.logout();
                  },
                  child: Text('Logout'),
                ),
                SizedBox(height:230),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
