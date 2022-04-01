import 'package:best_consultant/views/auth/login.dart';
import 'package:best_consultant/views/auth/sign_up.dart';
import 'package:flutter/material.dart';

import 'services/paypal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SignUpPage());
  }
}
