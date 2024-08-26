import 'package:flutter/material.dart';

import '../../../../core/theme_app/app_color.dart';

class NoAccountText extends StatelessWidget {
  final String text;
  final void Function() ontap;
  const NoAccountText({
    super.key,
    required this.text,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Don’t have an account? ",
            style: TextStyle(color: Color(0xFF757575), fontSize: 16),
          ),
          GestureDetector(
            onTap: ontap,
            child: Text(
              text,
              style: const TextStyle(color: AppColor.primary, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
