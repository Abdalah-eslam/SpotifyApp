import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:spotify_app/features/auth/domain/usecase/auth_usecase.dart';
import 'package:spotify_app/features/home/data/models/song_model.dart';
import 'package:spotify_app/features/home/domain/entities/songEnitites.dart';
import 'package:spotify_app/serviceLocator.dart';

abstract class SongFirebaseService {
  Future<Either> getNewestSongs();
}

class SongFirebaseServiceImpl extends SongFirebaseService {
  @override
  Future<Either> getNewestSongs() async {
    try {
      List<Songenitites> Songs = [];
      var data = await FirebaseFirestore.instance
          .collection("songs")
          .orderBy("releaseDate", descending: true)
          .get();
      for (var element in data.docs) {
        var songmodal = SongeModel.formJson(element.data());
        bool isfavorite =
            await sl<isfavUseCase>().call(params: element.reference.id);

        songmodal.isFav = isfavorite;
        songmodal.songID = element.reference.id;
        Songs.add(songmodal);
      }
      return right(Songs);
    } catch (e) {
      return left(e.toString());
    }
  }
}
