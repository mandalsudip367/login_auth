import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_auth/Routes.dart';
import 'package:login_auth/Screens/MainScreen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _validator = GlobalKey<FormState>();
  static Future<User?> loginUsingEmailPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("no user found with this email");
      }
    }
    return user;
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailcontroler = TextEditingController();
    TextEditingController _passwordcontroler = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Whatsapp")),
      ),
      body: Material(
        child: Form(
          key: _validator,
          child: Column(
            children: [
              const Center(
                child: Text("Whatsapp", style: TextStyle(fontSize: 50)),
              ),
              Padding(
                padding: const EdgeInsets.all(26.0),
                child: TextFormField(
                  controller: _emailcontroler,
                  keyboardType: TextInputType.emailAddress,
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'Please enter some text';
                  //   }
                  //   return null;
                  // },
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelText: "Enter Your Phone No",
                      hintText: "eg 7984203913"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(26.0),
                child: TextFormField(
                  controller: _passwordcontroler,
                  // validator: (value) {
                  //   if (value == null || value.length < 10) {
                  //     return "Please enter 10 digit no";
                  //   }
                  // },
                  decoration: const InputDecoration(
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          borderSide: BorderSide(color: Colors.blue)),
                      filled: true,
                      labelText: "Enter Your Password",
                      hintText: "eg 123456"),
                  obscureText: true,
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              ElevatedButton(
                  onPressed: () async {
                    if (_validator.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data...')),
                      );
                      await Future.delayed(Duration(seconds: 3));
                      User? user = await loginUsingEmailPassword(
                          email: _emailcontroler.text,
                          password: _passwordcontroler.text,
                          context: context);
                      print(user);
                      if (user != null) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MainScreen()));
                      }
                    }
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(color: Colors.black),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
