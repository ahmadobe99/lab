import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lab/login.dart';
import 'package:lab/view.dart';

final _firestore = FirebaseFirestore.instance;
User? currentUser;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _auth = FirebaseAuth.instance;
  @override
  void initState() {
    getCurrentUser();
    super.initState();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        currentUser = await user;
      }
    } catch (e) {
      throw e;
    }
  }

  Color getcolor() {
    if (currentUser!.email.toString().contains("red"))
      return Colors.red;
    else if (currentUser!.email.toString().contains("yellwo"))
      return Colors.yellowAccent;
    else if (currentUser!.email.toString().contains("blue"))
      return Colors.blue;
    else if (currentUser!.email.toString().contains("green"))
      return Colors.green;
    else
      return Colors.grey;
  }

  String? type;
  TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pop(context);
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
              RadioListTile(
                title: Text(
                  "Admin",
                  style: TextStyle(fontSize: 24, color: Colors.black),
                ),
                activeColor: Colors.red,
                tileColor: Colors.amber,
                value: "admin",
                groupValue: type,
                onChanged: (value) {
                  setState(() {
                    type = value.toString();
                  });
                },
              ),
              RadioListTile(
                  activeColor: Colors.red,
                  title: Text(
                    "User",
                    style: TextStyle(fontSize: 24, color: Colors.black),
                  ),
                  tileColor: Colors.amber,
                  value: "user",
                  groupValue: type,
                  onChanged: (value) {
                    setState(
                      () {
                        type = value.toString();
                      },
                    );
                  }),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: name,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter your Name',
                      ),
                ),
              ),
              ElevatedButton(
                  onPressed: (() {
                    CollectionReference db =
                        FirebaseFirestore.instance.collection("users");
                    db.add({"type": type,
                    "name":name.text,
                    "thedateofcreation":DateTime.now()});

                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return View_Screen();
                      },
                    ));
                  }),
                  child: Text("show details"))
            ],
          ),
        ),
      ),
    );
  }
}
