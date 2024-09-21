import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:spotify_app/features/auth/domain/usecase/auth_usecase.dart';
import 'package:spotify_app/serviceLocator.dart';

part 'fav_button_state.dart';

class FavButtonCubit extends Cubit<FavButtonState> {
  FavButtonCubit() : super(FavButtonInitial());

  void favButtonUpdated(String SongID) async {
    var result = await sl<AddOrRemoveFavUsecase>().call(params: SongID);
    result.fold((l) {}, (isfav) {
      emit(FavButtonUpdated(isfav: isfav));
    });
  }
}
