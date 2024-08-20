import 'package:flutter/material.dart';

import 'package:spotify_app/core/assets/images/images.dart';
import 'package:spotify_app/core/theme_app/app_color.dart';

import 'package:spotify_app/core/widgets/showlogo.dart';
import 'package:spotify_app/features/intro/themeMode_view.dart';

class Introview extends StatelessWidget {
  const Introview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.darkbackground,
      body: Stack(
        children: [
          Image.asset(
            Images.introBg,
            fit: BoxFit.fill,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 60),
              child: Column(
                children: [
                  const Showlogo(),
                  const Spacer(
                    flex: 12,
                  ),
                  const Text(
                    'Enjoy listening To Music',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sagittis enim purus sed phasellus. Cursus ornare id scelerisque aliquam.',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColor.gray),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ThemeModeView()));
                    },
                    child: Text(
                      'Get started',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 80),
                        backgroundColor: AppColor.primary,
                        textStyle: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w800)),
                  ),
                  const Spacer(
                    flex: 1,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
