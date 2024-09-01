import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spotify_app/features/home/domain/entities/songEnitites.dart';

class SongeModel extends Songenitites {
  final String title, Artist;
  final num duration;
  final Timestamp releaseDate;

  SongeModel(
      {required this.title,
      required this.Artist,
      required this.duration,
      required this.releaseDate})
      : super(
            title: title,
            Artist: Artist,
            duration: duration,
            releaseDate: releaseDate);

  factory SongeModel.formJson(Map<String, dynamic> json) {
    return SongeModel(
        title: json['title'],
        Artist: json['artist'],
        duration: json['duration'],
        releaseDate: json['releaseDate']);
  }
}
