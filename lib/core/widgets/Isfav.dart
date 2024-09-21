import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_app/core/bloc/cubit/fav_button_cubit.dart';
import 'package:spotify_app/core/helpers/Is_darkmode.dart';
import 'package:spotify_app/features/home/domain/entities/songEnitites.dart';

import '../theme_app/app_color.dart';

class FavICon extends StatelessWidget {
  final Songenitites songenitites;
  const FavICon({super.key, required this.songenitites});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavButtonCubit(),
      child: BlocBuilder<FavButtonCubit, FavButtonState>(
        builder: (context, state) {
          if (state is FavButtonInitial) {
            return IconButton(
                onPressed: () {
                  print(
                      "_________________${songenitites.isFav}____________________");
                  context
                      .read<FavButtonCubit>()
                      .favButtonUpdated(songenitites.songID);
                },
                icon: Icon(
                  songenitites.isFav
                      ? Icons.favorite
                      : Icons.favorite_outline_outlined,
                  color: context.Isdarkmode ? AppColor.darkgray : AppColor.gray,
                ));
          }
          if (state is FavButtonUpdated) {
            return IconButton(
                onPressed: () {
                  print(
                      "_________________${songenitites.isFav}____________________");
                  context
                      .read<FavButtonCubit>()
                      .favButtonUpdated(songenitites.songID);
                },
                icon: Icon(
                  songenitites.isFav
                      ? Icons.favorite
                      : Icons.favorite_outline_outlined,
                  color: context.Isdarkmode ? AppColor.darkgray : AppColor.gray,
                ));
          }
          return Container();
        },
      ),
    );
  }
}
