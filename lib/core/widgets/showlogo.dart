import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../assets/vectors/vectors.dart';

class Showlogo extends StatelessWidget {
  const Showlogo({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      Vectors.Logo,
    );
  }
}
