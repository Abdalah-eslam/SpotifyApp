import 'package:flutter/material.dart';

import 'package:spotify_app/core/widgets/showlogo.dart';
import 'package:spotify_app/features/intro/introView.dart';

class Splashview extends StatefulWidget {
  const Splashview({super.key});

  @override
  State<Splashview> createState() => _SplashviewState();
}

class _SplashviewState extends State<Splashview> {
  @override
  @override
  void initState() {
    super.initState();
    react();
  }

  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Showlogo(),
      ),
    );
  }

  Future<void> react() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (BuildContext) => Introview()));
  }
}
