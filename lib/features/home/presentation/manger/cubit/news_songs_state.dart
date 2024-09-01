part of 'news_songs_cubit.dart';

@immutable
sealed class NewsSongsState {}

final class NewsSongsInitial extends NewsSongsState {}

final class NewsSongsSuccess extends NewsSongsState {
  final List<Songenitites> Songs;

  NewsSongsSuccess(this.Songs);
}

final class NewsSongsFailure extends NewsSongsState {}

final class NewsSongsLoading extends NewsSongsState {}
