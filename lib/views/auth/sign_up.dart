import 'package:flutter/material.dart';

import 'login.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              clipper: MyClipper(),
              child: Container(
                height: 250.0,
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height - 250.0,
                width: MediaQuery.of(context).size.width,
                // decoration: const BoxDecoration(
                //     // image: DecorationImage(
                //     //   image: AssetImage("icon/back.png"),
                //     //   fit: BoxFit.cover,
                //     // ),
                //     ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: SafeArea(
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        FadeAnimation(
                          2,
                          Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            padding: const EdgeInsets.only(left: 10),
                            decoration: const BoxDecoration(
                              color: Color(0xFFdedbed),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(Icons.person_outline),
                                Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.only(left: 10),
                                    child: TextFormField(
                                      maxLines: 1,
                                      decoration: const InputDecoration(
                                        label: Text("Email"),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        FadeAnimation(
                          2,
                          Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            padding: const EdgeInsets.only(left: 10),
                            decoration: const BoxDecoration(
                              color: Color(0xFFdedbed),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(Icons.lock_outline),
                                Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.only(left: 10),
                                    child: TextFormField(
                                      maxLines: 1,
                                      decoration: const InputDecoration(
                                        label: Text("Password"),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        FadeAnimation(
                          2,
                          Container(
                            width: double.infinity,
                            alignment: Alignment.center,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            decoration: const BoxDecoration(
                              color: Color(0xFF536DFE),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            ),
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 30),
                          child: const Text(
                            "Already have an account?",
                            style: TextStyle(
                              color: Colors.black12,
                              letterSpacing: 2,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
