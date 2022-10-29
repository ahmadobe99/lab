import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lab/login.dart';
final _firestore = FirebaseFirestore.instance;
late User currentuser;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _auth = FirebaseAuth.instance;
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        currentuser = await user;
      }
    } catch (e) {
      throw e;
    }
  }

  Color getcolor() {
    if (currentuser.email.toString().contains("red"))
      return Colors.red;
    else if (currentuser.email.toString().contains("yellwo"))
      return Colors.yellowAccent;
    else if (currentuser.email.toString().contains("blue"))
      return Colors.blue;
    else if (currentuser.email.toString().contains("green"))
      return Colors.green;
    else
      return Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
              },
              icon: Icon(Icons.logout_rounded))
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(color: getcolor()),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome ",
                style: TextStyle(fontSize: 25),
              ),
              TextButton(
                  onPressed: (() {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return Login();
                      },
                    ));
                  }),
                  child: Text("Back"))
            ],
          ),
        ),
      ),
    );
  }
}
