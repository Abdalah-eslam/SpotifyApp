import 'package:dartz/dartz.dart';
import 'package:spotify_app/features/auth/data/models/create_user_req.dart';
import 'package:spotify_app/features/auth/data/models/signIn_user_req.dart';

abstract class AuthRepo {
  Future<Either> signIn(SigninUserReq user);
  Future<Either> signUp(CreateUserReq user);
}
