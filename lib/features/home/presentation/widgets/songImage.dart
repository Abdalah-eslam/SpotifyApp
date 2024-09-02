import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:spotify_app/core/helpers/Is_darkmode.dart';
import 'package:spotify_app/core/theme_app/app_color.dart';

class SongImage extends StatelessWidget {
  const SongImage({super.key, required this.imageSrc});
  final String imageSrc;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      child: AspectRatio(
        aspectRatio: 2.5 / 4,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: CachedNetworkImageProvider(
                  'https://firebasestorage.googleapis.com/v0/b/spotify-59c56.appspot.com/o/covers%2F' +
                      imageSrc.toLowerCase() +
                      '.jpeg?alt=media',
                ),
              )),
          child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                height: 40,
                width: 40,
                transform: Matrix4.translationValues(-5, 10, 0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        context.Isdarkmode ? AppColor.darkgray : AppColor.gray),
                child: IconButton(
                    onPressed: () {}, icon: Icon(Icons.play_arrow_rounded)),
              )),
        ),
      ),
    );
  }
}
