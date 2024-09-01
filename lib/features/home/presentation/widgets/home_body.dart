import 'package:flutter/material.dart';
import 'package:spotify_app/features/home/presentation/widgets/home_card.dart';
import 'package:spotify_app/features/home/presentation/widgets/newSongs.dart';
import 'package:spotify_app/features/home/presentation/widgets/tap_bar.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        homecard(),
        customTapbar(tabController: _tabController),
        SizedBox(
          height: MediaQuery.of(context).size.height * .5,
          child: TabBarView(
            controller: _tabController,
            children: const [
              NewsSongs(),
              Center(child: Text('Video Content')),
              Center(child: Text('Artists Content')),
              Center(child: Text('Podcasts Content')),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
