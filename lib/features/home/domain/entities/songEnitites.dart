import 'package:cloud_firestore/cloud_firestore.dart';

class Songenitites {
  final String title, Artist;
  final num duration;
  final Timestamp releaseDate;

  Songenitites(this.title, this.Artist, this.duration, this.releaseDate);
}
