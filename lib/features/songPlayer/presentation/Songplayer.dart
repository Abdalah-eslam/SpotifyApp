import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:spotify_app/core/helpers/Is_darkmode.dart';
import 'package:spotify_app/core/theme_app/app_color.dart';
import 'package:spotify_app/features/home/domain/entities/songEnitites.dart';
import 'package:spotify_app/features/songPlayer/presentation/manger/cubit/songplayer_cubit.dart';

class Songplayer extends StatelessWidget {
  const Songplayer({super.key, required this.song});
  final Songenitites song;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SongplayerCubit()..loadingSong(song.url),
      child: Scaffold(
        appBar: AppBar(
          leading: Container(
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_new),
            ),
          ),
          centerTitle: true,
          title: const Text(
            'Now playing',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
          ),
          actions: const [
            Icon(
              Icons.more_vert,
              size: 25,
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * .5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: CachedNetworkImageProvider(
                          'https://firebasestorage.googleapis.com/v0/b/spotify-59c56.appspot.com/o/covers%2F' +
                              song.title.toLowerCase() +
                              '.jpeg?alt=media',
                        ))),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ' ' + song.title,
                        style: const TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 22),
                      ),
                      Opacity(
                        opacity: 0.9,
                        child: Text(
                          ' ' + song.Artist,
                          style: const TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite_outline_outlined,
                        size: 35,
                        color: context.Isdarkmode
                            ? AppColor.gray
                            : AppColor.darkgray,
                      ))
                ],
              ),
              songSlider(),
            ],
          ),
        ),
      ),
    );
  }
}

class songSlider extends StatelessWidget {
  const songSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocConsumer<SongplayerCubit, SongplayerState>(
        listener: (context, state) {
          if (state is SongplayerSuccesed) {
            context.read<SongplayerCubit>().isloading = false;
          }
        },
        builder: (context, state) {
          if (state is SongplayerSuccesed) {
            return Skeletonizer(
              enabled: context.read<SongplayerCubit>().isloading,
              child: Column(
                children: [
                  Slider(
                    value: context
                        .read<SongplayerCubit>()
                        .position
                        .inSeconds
                        .toDouble(),
                    onChanged: (value) {},
                    min: 0,
                    max: context
                        .read<SongplayerCubit>()
                        .duration
                        .inSeconds
                        .toDouble(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(covertDuration(
                          context.read<SongplayerCubit>().position)),
                      Text(covertDuration(
                          context.read<SongplayerCubit>().duration)),
                    ],
                  )
                ],
              ),
            );
          }
          return Container();
        },
      ),
    );
  }

  String covertDuration(Duration dur) {
    final minutes = dur.inMinutes.remainder(60);
    final seconds = dur.inSeconds.remainder(60);
    return '${minutes.toString().padLeft(1, '0')}:${seconds.toString().padLeft(1, '0')} ';
  }
}
