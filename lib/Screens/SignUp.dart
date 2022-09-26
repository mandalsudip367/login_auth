import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(right: 45),
          child: Center(
            child: Text("SignUp"),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.all(35.0),
            child: TextFormField(
              decoration: InputDecoration(hintText: "Enter Email Address"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(35.0),
            child: TextFormField(
              decoration: InputDecoration(hintText: "Create Password"),
              obscureText: true,
            ),
          ),
          ElevatedButton(
            onPressed: null,
            child: Text("SignUp"),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green)),
          ),
        ],
      ),
    );
  }
}
