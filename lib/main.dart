import 'package:flutter/material.dart';
import 'package:login_auth/Routes.dart';
import 'package:login_auth/Screens/MainScreen.dart';
import 'package:login_auth/Screens/SignUp.dart';
import 'package:login_auth/Screens/firebase.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: MyRoutes.MainScreen,
      theme: ThemeData(primarySwatch: Colors.green),
      // home: const FBPage(),
      routes: {
        "/": (context) => FBPage(),
        "/MainScreen": (context) => MainScreen(),
        "/Signup": (context) => SignUpScreen()
      },
    );
  }
}
