import 'package:flutter/material.dart';
import 'package:spotify_app/core/helpers/Is_darkmode.dart';
import 'package:spotify_app/core/widgets/Isfav.dart';
import 'package:spotify_app/features/home/domain/entities/songEnitites.dart';
import 'package:spotify_app/features/songPlayer/presentation/Songplayer.dart';

import '../../../../core/theme_app/app_color.dart';

class SongsitemListview extends StatelessWidget {
  const SongsitemListview({super.key, required this.songs});
  final List<Songenitites> songs;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: context.Isdarkmode ? AppColor.darkgray : AppColor.gray),
            child: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Songplayer(
                          song: songs[index],
                        ),
                      ));
                },
                icon: const Icon(Icons.play_arrow_rounded)),
          ),
          title: Text(songs[index].title),
          tileColor: Colors.transparent,
          titleTextStyle: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: context.Isdarkmode ? Colors.white : Colors.black),
          subtitleTextStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: context.Isdarkmode ? Colors.white : Colors.black),
          subtitle: Opacity(
              opacity: 0.6,
              child: Text(
                songs[index].Artist,
              )),
          trailing: SizedBox(
            width: 150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  songs[index].duration.toString().replaceAll('.', ':'),
                  style: const TextStyle(fontSize: 16),
                ),
                FavICon(songenitites: songs[index])
              ],
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          height: 8,
        );
      },
      itemCount: songs.length,
    );
  }
}
