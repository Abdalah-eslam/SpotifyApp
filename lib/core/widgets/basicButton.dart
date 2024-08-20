import 'package:flutter/material.dart';
import 'package:spotify_app/core/theme_app/app_color.dart';

class BasicButton extends StatelessWidget {
  final void Function()? ontap;
  final String title;
  const BasicButton({
    super.key,
    this.ontap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: ontap,
      child: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 80),
          backgroundColor: AppColor.primary,
          textStyle:
              const TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
    );
  }
}
