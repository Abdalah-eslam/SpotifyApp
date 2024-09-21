import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spotify_app/features/home/domain/entities/songEnitites.dart';

class SongeModel extends Songenitites {
  final String title, Artist;
  final String url;
  final num duration;
  String songID;
  final Timestamp releaseDate;
  bool isFav;

  SongeModel(
      {required this.title,
      required this.Artist,
      required this.duration,
      required this.releaseDate,
      required this.url,
      required this.songID,
      this.isFav = false})
      : super(
            songID: songID,
            title: title,
            Artist: Artist,
            duration: duration,
            releaseDate: releaseDate,
            url: url,
            isFav: isFav);

  factory SongeModel.formJson(Map<String, dynamic> json) {
    return SongeModel(
      title: json['title'],
      url: json['Url'],
      Artist: json['artist'],
      duration: json['duration'],
      releaseDate: json['releaseDate'],
      isFav: json['isFav'] ?? false,
      songID: json['SongID'] ?? '',
    );
  }
}
