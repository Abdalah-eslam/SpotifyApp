import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_app/core/theme_app/app_color.dart';

class CustomFormfield extends StatelessWidget {
  const CustomFormfield(
      {super.key,
      this.onsaved,
      required this.hint,
      required this.labelhint,
      required this.iconString});
  final Function(String?)? onsaved;
  final String hint;
  final String labelhint;
  final String iconString;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'this feild is reqiured';
          }
        },
        onSaved: onsaved,
        onChanged: onsaved,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            hintText: hint,
            labelText: labelhint,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintStyle: const TextStyle(color: Color(0xFF757575)),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 30,
            ),
            suffix: SvgPicture.string(
              iconString,
            ),
            border: authOutlineInputBorder,
            enabledBorder: authOutlineInputBorder,
            focusedBorder: authOutlineInputBorder.copyWith(
                borderSide: const BorderSide(color: AppColor.primary))),
      ),
    );
  }
}

const authOutlineInputBorder = OutlineInputBorder(
  borderSide: BorderSide(color: Color(0xFF757575)),
  borderRadius: BorderRadius.all(Radius.circular(100)),
);
