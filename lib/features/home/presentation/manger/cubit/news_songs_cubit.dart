import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:spotify_app/features/home/domain/entities/songEnitites.dart';
import 'package:spotify_app/features/home/domain/usecases/newestSong_usecase.dart';
import 'package:spotify_app/serviceLocator.dart';

part 'news_songs_state.dart';

class NewsSongsCubit extends Cubit<NewsSongsState> {
  NewsSongsCubit() : super(NewsSongsLoading());

  Future<void> getNewsSong() async {
    var data = await sl.get<NewestsongUsecase>().call();
    data.fold((l) {
      emit(NewsSongsFailure());
    }, (data) {
      emit(NewsSongsSuccess(data));
    });
  }
}
