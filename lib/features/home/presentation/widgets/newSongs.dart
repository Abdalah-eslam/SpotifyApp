import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_app/features/home/presentation/manger/cubit/news_songs_cubit.dart';

class NewsSongs extends StatelessWidget {
  const NewsSongs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsSongsCubit()..getNewsSong(),
      child: BlocBuilder<NewsSongsCubit, NewsSongsState>(
        builder: (context, state) {
          if (state is NewsSongsSuccess) {
            return ListView.separated(
                itemBuilder: (context, index) {
                  return const Column(
                    children: [],
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: 12,
                  );
                },
                itemCount: state.Songs.length);
          }
          if (state is NewsSongsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return const Center(child: Icon(Icons.error));
          }
        },
      ),
    );
  }
}
