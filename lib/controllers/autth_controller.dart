import 'package:best_consultant/views/home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Firebase user sign up with email, name, password
  Future<User?> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final authResult = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = authResult.user;
      await user!.updateDisplayName(name);
      print('User created');
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Firebase user sign in with email, password
  Future<User?> signInWithEmailAndPassword(
      {required String email, required String password, required ctx}) async {
    try {
      final authResult = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      final user = authResult.user;
      print("User signed in: ${user!.uid}");
      Navigator.push(ctx, MaterialPageRoute(builder: (ctx) => HomePage()));
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Firebase user sign out
  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }

  // Save sign up user data to Firestore database
  Future<void> saveUserData({
    required String email,
    required String firstName,
    required String lastName,
    required String city,
    required String country,
    required String password,
  }) async {
    await FirebaseFirestore.instance.collection('users').doc().set({
      'password': password,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'city': city,
      'country': country
    });
  }

  // use firestore data to login
  Future<void> loginUser({
    required String email,
    required String password,
    required ctx,
  }) async {
    try {
      final user = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: email)
          .get();
      if (user.docs.isNotEmpty) {
        final userData = user.docs[0].data();
        if (userData['password'] == password) {
          Navigator.push(ctx, MaterialPageRoute(builder: (ctx) => HomePage()));
        } else {
          print('Password is incorrect');
        }
      } else {
        print('User does not exist');
      }
      print("User signed in: ${user.docs[0].id}");
      Navigator.push(ctx, MaterialPageRoute(builder: (ctx) => HomePage()));
    } catch (e) {
      print(e.toString());
    }
  }
}
