import 'package:flutter/material.dart';

import 'package:spotify_app/features/home/presentation/widgets/home_card.dart';
import 'package:spotify_app/features/home/presentation/widgets/tap_bar.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        homecard(),
        const customTapbar(),
      ],
    );
  }
}
