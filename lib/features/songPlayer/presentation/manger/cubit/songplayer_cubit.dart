import 'package:bloc/bloc.dart';

import 'package:just_audio/just_audio.dart';
import 'package:meta/meta.dart';

part 'songplayer_state.dart';

class SongplayerCubit extends Cubit<SongplayerState> {
  bool isloading = true;
  AudioPlayer audioPlayer = AudioPlayer();
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  SongplayerCubit() : super(Songplayerloading()) {
    audioPlayer.positionStream.listen((pos) {
      position = pos;
      update();
    });
    audioPlayer.durationStream.listen((dur) {
      duration = dur!;
    });
  }

  void update() {
    emit(SongplayerSuccesed());
  }

  Future<void> loadingSong(String Url) async {
    try {
      await audioPlayer.setUrl(Url);
      await audioPlayer.play();
      emit(SongplayerSuccesed());
    } catch (e) {
      emit(SongplayerFailure());
    }
  }

  void playOrpauseSong() {
    if (audioPlayer.playing) {
      audioPlayer.stop();
    } else {
      audioPlayer.play();
    }
    emit(SongplayerSuccesed());
  }

  Future<void> close() {
    return audioPlayer.dispose();
  }
}
