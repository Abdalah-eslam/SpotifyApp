import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify_app/features/auth/data/models/create_user_req.dart';
import 'package:spotify_app/features/auth/data/models/signIn_user_req.dart';

abstract class AuthFirebaseService {
  Future<Either> signIn(SigninUserReq user);
  Future<Either> signUp(CreateUserReq user);
}

class AuthFirebaseServiceimpl implements AuthFirebaseService {
  @override
  Future<Either> signIn(SigninUserReq user) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: user.email, password: user.password);

      return right('Login Successful');
    } on FirebaseAuthException catch (e) {
      String massage = '';
      if (e.code == 'user-not-found') {
        massage = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        massage = 'Wrong password provided for that user.';
      }
      return left(massage);
    }
  }

  @override
  Future<Either> signUp(CreateUserReq user) async {
    try {
      var data = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
      FirebaseFirestore.instance
          .collection('Users')
          .add({'name': user.fullname, 'Email': data.user!.email});

      return right('signUp is successful');
    } on FirebaseAuthException catch (e) {
      String massage = '';
      if (e.code == 'weak-password') {
        massage = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        massage = 'The account already exists for that email.';
      }
      return left(massage);
    } catch (e) {
      return left(e.toString());
    }
  }
}
