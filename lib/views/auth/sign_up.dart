import 'package:best_consultant/controllers/autth_controller.dart';
import 'package:flutter/material.dart';
import '../home_page.dart';
import 'login.dart';

// ignore: must_be_immutable
class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);
  AuthService fireAuth = AuthService();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController countryController = TextEditingController();

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
                          GestureDetector(
                            onTap: () {},
                            child: Container(
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
                                        controller: firstNameController,
                                        maxLines: 1,
                                        decoration: const InputDecoration(
                                          label: Text("First Name"),
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        FadeAnimation(
                          2,
                          GestureDetector(
                            onTap: () {},
                            child: Container(
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
                                        controller: lastNameController,
                                        maxLines: 1,
                                        decoration: const InputDecoration(
                                          label: Text("Last Name"),
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
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
                                const Icon(Icons.person_outline),
                                Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.only(left: 10),
                                    child: TextFormField(
                                      controller: emailController,
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
                                      controller: passController,
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
                                      controller: countryController,
                                      maxLines: 1,
                                      decoration: const InputDecoration(
                                        label: Text("Country"),
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
                                      controller: cityController,
                                      maxLines: 1,
                                      decoration: const InputDecoration(
                                        label: Text("City"),
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
                          GestureDetector(
                            onTap: () async {
                              // fireAuth.signUpWithEmailAndPassword(
                              //     email: emailController.text,
                              //     password: passController.text,
                              //     name: nameController.text);
                              fireAuth
                                  .saveUserData(
                                    email: emailController.text,
                                    firstName: firstNameController.text,
                                    lastName: lastNameController.text,
                                    city: cityController.text,
                                    country: countryController.text,
                                    password: passController.text,
                                  )
                                  .then((value) => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginPage())));
                            },
                            child: Container(
                              width: double.infinity,
                              alignment: Alignment.center,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 10),
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
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Already have an account?",
                              style: TextStyle(
                                color: Colors.black38,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()),
                                );
                              },
                              child: const Text(
                                " Sign In",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
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
