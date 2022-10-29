import 'package:flutter/material.dart';
import 'package:lab/login.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
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
    );
  }
}
