import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_auth/Screens/login_screen.dart';

class FBPage extends StatefulWidget {
  const FBPage({super.key});

  @override
  State<FBPage> createState() => _FBPageState();
}

class _FBPageState extends State<FBPage> {
  Future<FirebaseApp> _fbAuth() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _fbAuth(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return const LoginPage();
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
