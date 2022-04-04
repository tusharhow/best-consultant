import 'package:best_consultant/controllers/autth_controller.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    AuthService authController = AuthService();
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
                  'Log In',
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
                        const SizedBox(height: 20),
                        FadeAnimation(
                          2,
                          GestureDetector(
                            onTap: () {
                              authController.signInWithEmailAndPassword(
                                email: emailController.text,
                                password: passController.text,
                                ctx: context,
                              );
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
                                "Login",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: const Text(
                "SignUp if don't have account ",
                style: TextStyle(
                  color: Colors.black12,
                  letterSpacing: 2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0, size.height - 90);
    var controllPoint = Offset(70, size.height);
    var endPoint = Offset(size.width / 2, size.height);
    path.quadraticBezierTo(
        controllPoint.dx, controllPoint.dy, endPoint.dx, endPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

enum AnimationType { opacity, translateY }

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  // ignore: use_key_in_widget_constructors
  const FadeAnimation(this.delay, this.child);

  @override
  Widget build(BuildContext context) {
    final tween = MultiTween<AnimationType>()
      ..add(
        AnimationType.opacity,
        Tween(begin: 0.0, end: 1.0),
        const Duration(milliseconds: 500),
      )
      ..add(
        AnimationType.translateY,
        Tween(begin: -30.0, end: 1.0),
        const Duration(milliseconds: 1000),
      );

    return PlayAnimation<MultiTweenValues<AnimationType>>(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builder: (context, child, value) => Opacity(
        opacity: value.get(AnimationType.opacity),
        child: Transform.translate(
            offset: Offset(0, value.get(AnimationType.translateY)),
            child: child),
      ),
    );
  }
}
