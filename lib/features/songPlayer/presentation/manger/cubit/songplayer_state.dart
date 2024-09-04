part of 'songplayer_cubit.dart';

@immutable
sealed class SongplayerState {}

final class Songplayerloading extends SongplayerState {}

final class SongplayerSuccesed extends SongplayerState {}

final class SongplayerFailure extends SongplayerState {}
