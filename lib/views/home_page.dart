import 'package:flutter/material.dart';

import 'auth/login.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          height: 250,
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Center(
          child: Text('Home Page'),
        ),
        SizedBox(
          height: 20,
        ),
        ElevatedButton(
          child: Text('Paypal Payment'),
          onPressed: () {
           
          },
        ),
      ],
    ));
  }
}
