import 'package:cloud_firestore/cloud_firestore.dart';

class Songenitites {
  final String title, Artist;
  final String url;
  final num duration;
  final Timestamp releaseDate;

  Songenitites(
      {required this.title,
      required this.Artist,
      required this.duration,
      required this.releaseDate,
      required this.url});
}
