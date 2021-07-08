import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Accountpage extends StatefulWidget {
  const Accountpage({Key key}) : super(key: key);

  @override
  _AccountpageState createState() => _AccountpageState();
}

class _AccountpageState extends State<Accountpage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User user;
  bool isloggedin = false;

  checkAuthentification() async {
    _auth.authStateChanges().listen((user) {
      if (user == null) {
        Navigator.of(context).pushReplacementNamed("StartPage");
      }
    });
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentification();
    this.getUser();
  }

  getUser() async {
    User firebaseUser = _auth.currentUser;
    await firebaseUser?.reload();
    firebaseUser = _auth.currentUser;

    if (firebaseUser != null) {
      setState(() {
        this.user = firebaseUser;
        this.isloggedin = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('Account'),
        backgroundColor: Colors.lightBlue.shade400,
      ),
      body: !isloggedin
          ? CircularProgressIndicator()
          : SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  if(user.photoURL == null)
                  Center(
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://www.searchpng.com/wp-content/uploads/2019/02/Deafult-Profile-Pitcher.png'),
                      radius: 80,
                    ),
                  )else
                    CircleAvatar(
                      backgroundImage: NetworkImage(user.photoURL),
                      radius: 80,
                    ),
                  SizedBox(
                    height: 15,
                  ),
                  Card(
                    color: Colors.grey[900],
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      title: Text(
                        '${user.displayName}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.grey[900],
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.email,
                        color: Colors.white,
                      ),
                      title: Text(
                        '${user.email}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
