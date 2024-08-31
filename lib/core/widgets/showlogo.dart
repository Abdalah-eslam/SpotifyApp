import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../assets/vectors/vectors.dart';

class Showlogo extends StatelessWidget implements PreferredSizeWidget {
  const Showlogo({super.key, this.padding});
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: SvgPicture.asset(
        Vectors.Logo,
        height: 40,
        width: 40,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
