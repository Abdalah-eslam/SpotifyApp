import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_app/core/assets/images/images.dart';
import 'package:spotify_app/core/assets/vectors/vectors.dart';
import 'package:spotify_app/core/helpers/Is_darkmode.dart';

import 'package:spotify_app/core/widgets/basic_appbar.dart';
import 'package:spotify_app/core/widgets/showlogo.dart';

import '../../../core/theme_app/app_color.dart';

class ChooseAuth extends StatelessWidget {
  const ChooseAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BasicAppbar(),
          Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset(Vectors.authBg),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: RotatedBox(
                quarterTurns: 2, child: SvgPicture.asset(Vectors.authBg)),
          ),
          Align(
              alignment: Alignment.bottomLeft,
              child: Image.asset(Images.AuthBg)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Showlogo(),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      'Enjoy listening to music',
                      style:
                          TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'Spotify is a proprietary Swedish audio streaming and media services provider ',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Text(
                              'Register',
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size(double.infinity, 80),
                                backgroundColor: AppColor.primary,
                                textStyle: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w800)),
                          ),
                        ),
                        Expanded(
                            flex: 1,
                            child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Sign in',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: context.Isdarkmode
                                          ? Colors.white
                                          : Colors.black),
                                )))
                      ],
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}
