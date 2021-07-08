import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:majorproject/page/home_page.dart';
import 'package:majorproject/provider/email_sign_in.dart';
import 'package:provider/provider.dart';
import 'provider/google_sign_in.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'NEWS APP';

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => GoogleSignInProvider()),
          ChangeNotifierProvider(create: (context) => EmailSignInProvider()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: title,
          theme: ThemeData(primarySwatch: Colors.deepOrange),
          home: HomePage(),
        ),
      );
}
