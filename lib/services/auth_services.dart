import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class AuthServices {
  FirebaseAuth auth = FirebaseAuth.instance;

  User? getUser() {
    return auth.currentUser;
  }

  Future<User?> registerUsingEmailPassword(
      {required String name,
        required String email,
        required String password,
        String? image}) async {
    User? user;
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
      await user?.updateDisplayName(name);
      await user?.reload();
      user = auth.currentUser;
      //image = user?.photoURL;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        log('password provided is too weak.');
      } else if (e.code == 'email-already in use.') {
        log('the account already exists for that email.');
      }
    }
    return user;
  }

  Future<User?> signInUsingEmailPassword({
    required String email,
    required String password,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        log('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        log('Wrong password provided.');
      }
    }
    return user;
  }
  Future<User?> resetpassword({required String email}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    await auth.sendPasswordResetEmail(email: email);
    return user;
  }
  // Future<void> signup(BuildContext context) async {
  //   final GoogleSignIn googleSignIn = GoogleSignIn();
  //   final GoogleSignInAccount? googleSignInAccount =
  //   await googleSignIn.signIn();
  //   if (googleSignInAccount != null) {
  //     final GoogleSignInAuthentication googleSignInAuthentication =
  //     await googleSignInAccount.authentication;
  //     final AuthCredential authCredential = GoogleAuthProvider.credential(
  //         idToken: googleSignInAuthentication.idToken,
  //         accessToken: googleSignInAuthentication.accessToken);
  //
  //     UserCredential result = await auth.signInWithCredential(authCredential);
  //
  //     if (result != null) {
  //       Navigator.push(
  //           context,
  //           MaterialPageRoute(
  //             builder: (context) => const DashboardScreen(),
  //           ));
  //     }
  //   }
  // }
}