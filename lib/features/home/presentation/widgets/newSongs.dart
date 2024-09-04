import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:spotify_app/features/home/presentation/manger/cubit/news_songs_cubit.dart';
import 'package:spotify_app/features/home/presentation/widgets/songImage.dart';
import 'package:spotify_app/features/home/presentation/widgets/songsItem_listview.dart';

class NewsSongs extends StatelessWidget {
  const NewsSongs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsSongsCubit()..getNewsSong(),
      child: BlocBuilder<NewsSongsCubit, NewsSongsState>(
        builder: (context, state) {
          if (state is NewsSongsSuccess) {
            return Skeletonizer(
              enabled: false,
              child: Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SongImage(
                                  imageSrc: state.Songs[index].title,
                                  song: state.Songs[index],
                                ),
                                Text(
                                  ' ' + state.Songs[index].title,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18),
                                ),
                                Opacity(
                                  opacity: 0.9,
                                  child: Text(
                                    ' ' + state.Songs[index].Artist,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            width: 12,
                          );
                        },
                        itemCount: state.Songs.length),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Play list',
                                style: TextStyle(
                                    fontWeight: FontWeight.w800, fontSize: 24),
                              ),
                              Text(
                                'See more',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                            child: SongsitemListview(
                                songs: state.Songs.reversed.toList()))
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          if (state is NewsSongsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return const Center(child: Icon(Icons.error));
          }
        },
      ),
    );
  }
}
