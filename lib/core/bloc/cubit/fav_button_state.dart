part of 'fav_button_cubit.dart';

@immutable
sealed class FavButtonState {}

final class FavButtonInitial extends FavButtonState {}

final class FavButtonUpdated extends FavButtonState {
  final bool isfav;

  FavButtonUpdated({required this.isfav});
}
