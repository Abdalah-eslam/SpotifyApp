import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:spotify_app/core/assets/images/images.dart';
import 'package:spotify_app/core/theme_app/app_color.dart';

import 'package:spotify_app/core/widgets/showlogo.dart';
import 'package:spotify_app/features/auth/presentation/choose_Auth.dart';
import 'package:spotify_app/features/intro/theme_cubit/theme_cubit.dart';
import 'package:spotify_app/features/intro/widgets/showIconMode.dart';

class ThemeModeView extends StatelessWidget {
  const ThemeModeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.darkbackground,
      body: Stack(
        children: [
          Image.asset(
            Images.themeBg,
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
                    'choose Theme Mode',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Showiconmode(
                        customICon: Icon(Icons.dark_mode),
                        data: 'Dark',
                        ontap: () {
                          BlocProvider.of<ThemeCubit>(context)
                              .update(ThemeMode.dark);
                        },
                      ),
                      Showiconmode(
                        customICon: Icon(Icons.light_mode),
                        data: 'Light',
                        ontap: () {
                          BlocProvider.of<ThemeCubit>(context)
                              .update(ThemeMode.light);
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ChooseAuth()));
                    },
                    child: Text(
                      'Continue',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 80),
                        backgroundColor: AppColor.primary,
                        textStyle: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w800)),
                  ),
                  Spacer(
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
