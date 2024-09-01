import 'package:dartz/dartz.dart';
import 'package:spotify_app/features/home/data/sources/song_firebase_service.dart';
import 'package:spotify_app/features/home/domain/repository/song_repo.dart';
import 'package:spotify_app/serviceLocator.dart';

class SongrepoImpl implements SongRepo {
  @override
  Future<Either> getNewestSongs() {
    return sl.get<SongFirebaseService>().getNewestSongs();
  }
}
