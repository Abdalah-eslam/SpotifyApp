import 'package:dartz/dartz.dart';
import 'package:spotify_app/features/auth/data/models/create_user_req.dart';
import 'package:spotify_app/features/auth/data/models/signIn_user_req.dart';
import 'package:spotify_app/features/auth/domain/repository/auth_repo.dart';

import '../../../../serviceLocator.dart';

abstract class Usecase<type, param> {
  Future<type> call({param params});
}

class SignUpUsecase implements Usecase<Either, CreateUserReq> {
  @override
  Future<Either> call({CreateUserReq? params}) async {
    return sl<AuthRepo>().signUp(params!);
  }
}

class SigninUsecase implements Usecase<Either, SigninUserReq> {
  @override
  Future<Either> call({SigninUserReq? params}) async {
    return sl<AuthRepo>().signIn(params!);
  }
}

class AddOrRemoveFavUsecase implements Usecase<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    return await sl<AuthRepo>().addOrRemoveFav(params!);
  }
}

class isfavUseCase implements Usecase<bool, String> {
  @override
  Future<bool> call({String? params}) async {
    return await sl<AuthRepo>().Isfav(params!);
  }
}
