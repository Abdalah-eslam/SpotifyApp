import 'package:get_it/get_it.dart';
import 'package:spotify_app/features/auth/data/repository/auth_repoImpl.dart';
import 'package:spotify_app/features/auth/domain/usecase/auth_usecase.dart';
import 'package:spotify_app/features/home/data/repository/songRepo_impl.dart';
import 'package:spotify_app/features/home/data/sources/song_firebase_service.dart';
import 'package:spotify_app/features/home/domain/repository/song_repo.dart';
import 'package:spotify_app/features/home/domain/usecases/newestSong_usecase.dart';

import 'features/auth/data/sources/auth_firebase_service.dart';
import 'features/auth/domain/repository/auth_repo.dart';

GetIt sl = GetIt.instance;

Future<void> inisializeDebend() async {
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceimpl());
  sl.registerSingleton<AuthRepo>(AuthRepoimpl());
  sl.registerSingleton<SignUpUsecase>(SignUpUsecase());
  sl.registerSingleton<SigninUsecase>(SigninUsecase());
  sl.registerSingleton<NewestsongUsecase>(NewestsongUsecase());
  sl.registerSingleton<SongFirebaseService>(SongFirebaseServiceImpl());
  sl.registerSingleton<AddOrRemoveFavUsecase>(AddOrRemoveFavUsecase());
  sl.registerSingleton<isfavUseCase>(isfavUseCase());
  sl.registerSingleton<SongRepo>(SongrepoImpl());
}
