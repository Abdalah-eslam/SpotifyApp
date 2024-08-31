import 'package:flutter/material.dart';
import 'package:spotify_app/core/helpers/Is_darkmode.dart';
import 'package:spotify_app/core/theme_app/app_color.dart';

class customTapbar extends StatefulWidget {
  const customTapbar({super.key});

  @override
  State<customTapbar> createState() => _customTapbarState();
}

class _customTapbarState extends State<customTapbar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SizedBox(
        height: 40,
        width: double.infinity,
        child: TabBar(
          enableFeedback: true,
          unselectedLabelStyle: TextStyle(
              fontSize: 16,
              color: context.Isdarkmode ? AppColor.gray : AppColor.darkgray),
          dividerColor: Colors.transparent,
          controller: _tabController,
          indicatorColor: AppColor.primary,
          labelStyle: TextStyle(
              fontSize: 20,
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
