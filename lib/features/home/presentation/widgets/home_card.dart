import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/assets/images/images.dart';
import '../../../../core/assets/vectors/vectors.dart';

Widget homecard() {
  return SizedBox(
      width: double.infinity,
      height: 180,
      child: Center(
          child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: SvgPicture.asset(Vectors.home),
          ),
          Positioned(
            left: 50,
            bottom: 1,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 40,
                ),
                child: Image.asset(Images.homeartist),
              ),
            ),
          )
        ],
      )));
}
