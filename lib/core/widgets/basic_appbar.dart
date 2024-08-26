import 'package:flutter/material.dart';
import 'package:spotify_app/core/helpers/Is_darkmode.dart';
import 'package:spotify_app/core/widgets/showlogo.dart';

class BasicAppbar extends StatelessWidget implements PreferredSize {
  const BasicAppbar({super.key, this.ontap});
  final void Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: const Showlogo(),
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: context.Isdarkmode
                    ? Colors.white.withOpacity(.03)
                    : Colors.black.withOpacity(.04)),
            child: Icon(
              Icons.arrow_back_ios_new,
              size: 15,
              color: context.Isdarkmode ? Colors.white : Colors.black,
            ),
          )),
    );
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
