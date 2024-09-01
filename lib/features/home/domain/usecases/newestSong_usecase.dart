import 'package:dartz/dartz.dart';
import 'package:spotify_app/features/auth/domain/usecase/auth_usecase.dart';
import 'package:spotify_app/features/home/domain/repository/song_repo.dart';
import 'package:spotify_app/serviceLocator.dart';

class NewestsongUsecase extends Usecase<Either, dynamic> {
  @override
  Future<Either> call({params}) {
    return sl.get<SongRepo>().getNewestSongs();
  }
}
