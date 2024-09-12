import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify_app/features/auth/data/models/create_user_req.dart';
import 'package:spotify_app/features/auth/data/models/signIn_user_req.dart';

abstract class AuthFirebaseService {
  Future<Either> signIn(SigninUserReq user);
  Future<Either> signUp(CreateUserReq user);
  Future<Either> addOrRemoveFav(String songId);
  Future<bool> Isfav(String songId);
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
          .doc(data.user!.uid)
          .set({'name': user.fullname, 'Email': data.user!.email});

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

  Future<Either> addOrRemoveFav(String songID) async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    var userID = firebaseAuth.currentUser!.uid;
    late bool Isfav;

    try {
      QuerySnapshot<Map<String, dynamic>> favSongs = await firebaseFirestore
          .collection('users')
          .doc(userID)
          .collection('favorite')
          .where('songID', isEqualTo: songID)
          .get();
      if (favSongs.docs.isNotEmpty) {
        favSongs.docs.first.reference.delete();
        Isfav = false;
      } else {
        await firebaseFirestore
            .collection('users')
            .doc(userID)
            .collection('favorite')
            .add({'songID': songID, 'releaseTme': Timestamp.now()});
        Isfav = true;
      }
      return right(Isfav);
    } on Exception catch (e) {
      return left('there was an error');
    }
  }

  @override
  Future<bool> Isfav(String songId) async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    var userID = firebaseAuth.currentUser!.uid;

    try {
      QuerySnapshot<Map<String, dynamic>> favSongs = await firebaseFirestore
          .collection('users')
          .doc(userID)
          .collection('favorite')
          .where('songID', isEqualTo: songId)
          .get();
      if (favSongs.docs.isNotEmpty) {
        favSongs.docs.first.reference.delete();
        return false;
      } else {
        await firebaseFirestore
            .collection('users')
            .doc(userID)
            .collection('favorite')
            .add({'songID': songId, 'releaseTme': Timestamp.now()});
        return true;
      }
    } on Exception catch (e) {
      return false;
    }
  }
}
