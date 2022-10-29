import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lab/home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          // Divider(
          //   height: 50,
          // ),
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.contain,
                    image: NetworkImage(
                        "https://th.bing.com/th/id/R.25451f24890c79a2b1c14072db772092?rik=PDPUXaXfIhoBiQ&riu=http%3a%2f%2fcdn.onlinewebfonts.com%2fsvg%2fimg_519216.png&ehk=l7iUf57tjbJkuRt6r94MTHds%2blm2Hn30JXj1x%2b%2fR%2b2Y%3d&risl=&pid=ImgRaw&r=0"))),
          ),
          Divider(
            height: 50,
          ),
          TextField(
            controller: email,
            decoration: InputDecoration(
              label: Text("Enter your email"),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            ),
          ),
          Divider(
            height: 20,
          ),
          TextField(
            controller: password,
            // obscureText: true,
            decoration: InputDecoration(
                label: Text("Enetr your password "),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20))),
          ),
          const Divider(
            height: 25,
          ),
          TextButton(
              onPressed: (() async {
                try {
                  var authopject = FirebaseAuth.instance;
                  UserCredential myUser =
                      await authopject.createUserWithEmailAndPassword(
                          email: email.text, password: password.text);
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("added sucessfully")));
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("sorry this is used ")));
                }
              }),
              child: Text("Signup")),
          TextButton(
              onPressed: (() async {
                try {
                  var authopject = FirebaseAuth.instance;
                  UserCredential myUser =
                      await authopject.signInWithEmailAndPassword(
                          email: email.text, password: password.text);
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(" sucessfully log in")));
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) {
                    return Home();
                  })));
                } catch (e) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text("wrong log in")));
                }
              }),
              child: Text("Log in"))
        ],
      ),
    );
  }
}
