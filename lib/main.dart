import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lab/home.dart';
import 'package:lab/login.dart';
import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

// Ideal time to initialize

  runApp(MaterialApp(home: MyApp()));
//...
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Login();
  }
}
// StreamBuilder<User?>(
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           return Home();
//         }
//         return Login();
//       },
//       stream: FirebaseAuth.instance.authStateChanges(),
//     );