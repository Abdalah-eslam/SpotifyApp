import 'package:flutter/material.dart';

import 'package:spotify_app/core/widgets/showlogo.dart';
import 'package:spotify_app/features/home/presentation/widgets/home_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: Showlogo(
        padding: EdgeInsets.only(top: 40),
      ),
      body: SingleChildScrollView(
        child: HomeBody(),
      ),
    );
  }
}
