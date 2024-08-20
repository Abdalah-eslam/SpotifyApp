import 'dart:ui';

import 'package:flutter/material.dart';

class Showiconmode extends StatelessWidget {
  const Showiconmode(
      {super.key, required this.customICon, required this.data, this.ontap});
  final Icon customICon;
  final String data;
  final void Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: ontap,
          child: ClipOval(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xff30393C).withOpacity(.5)),
                child: customICon,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Center(
          child: Text(
            data,
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }
}
