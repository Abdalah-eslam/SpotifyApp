import 'package:dartz/dartz.dart';

import 'package:spotify_app/features/auth/data/models/signIn_user_req.dart';
import 'package:spotify_app/features/auth/data/sources/auth_firebase_service.dart';
import 'package:spotify_app/features/auth/domain/repository/auth_repo.dart';

import '../../../../serviceLocator.dart';
import '../models/create_user_req.dart';

class AuthRepoimpl implements AuthRepo {
  @override
  Future<Either> signIn(SigninUserReq user) {
    return sl<AuthFirebaseService>().signIn(user);
  }

  @override
  Future<Either> signUp(CreateUserReq user) async {
    return sl<AuthFirebaseService>().signUp(user);
  }

  @override
  Future<Either> addOrRemoveFav(String songID) {
    return sl<AuthFirebaseService>().addOrRemoveFav(songID);
  }

  @override
  Future<bool> Isfav(String songID) {
    return sl<AuthFirebaseService>().Isfav(songID);
  }
}
