import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../assets/vectors/vectors.dart';

class Showlogo extends StatelessWidget implements PreferredSizeWidget {
  const Showlogo({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      Vectors.Logo,
      height: 40,
      width: 40,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
