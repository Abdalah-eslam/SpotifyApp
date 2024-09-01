import 'package:flutter/material.dart';
import 'package:spotify_app/core/helpers/Is_darkmode.dart';
import 'package:spotify_app/core/theme_app/app_color.dart';

class customTapbar extends StatefulWidget {
  const customTapbar({super.key, required this.tabController});
  final TabController tabController;
  @override
  State<customTapbar> createState() => _customTapbarState();
}

class _customTapbarState extends State<customTapbar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SizedBox(
        height: 40,
        width: double.infinity,
        child: TabBar(
          overlayColor: const WidgetStatePropertyAll(Colors.transparent),
          enableFeedback: true,
          unselectedLabelStyle: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 15,
              color: context.Isdarkmode ? AppColor.gray : AppColor.darkgray),
          dividerColor: Colors.transparent,
          controller: widget.tabController,
          indicatorColor: AppColor.primary,
          labelStyle: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 17,
              color: context.Isdarkmode ? Colors.white : Colors.black),
          tabs: const [
            Text('News'),
            Text('vedio'),
            Text('Artists'),
            Text('podcasts'),
          ],
        ),
      ),
    );
  }
}
