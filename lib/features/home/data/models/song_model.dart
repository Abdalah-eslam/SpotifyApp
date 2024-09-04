import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spotify_app/features/home/domain/entities/songEnitites.dart';

class SongeModel extends Songenitites {
  final String title, Artist;
  final String url;
  final num duration;
  final Timestamp releaseDate;

  SongeModel(
      {required this.title,
      required this.Artist,
      required this.duration,
      required this.releaseDate,
      required this.url})
      : super(
            title: title,
            Artist: Artist,
            duration: duration,
            releaseDate: releaseDate,
            url: url);

  factory SongeModel.formJson(Map<String, dynamic> json) {
    return SongeModel(
        title: json['title'],
        url: json['Url'],
        Artist: json['artist'],
        duration: json['duration'],
        releaseDate: json['releaseDate']);
  }
}
