import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_app/core/theme_app/app_theme.dart';
import 'package:spotify_app/features/intro/theme_cubit/theme_cubit.dart';
import 'package:spotify_app/features/splash/presentation/widgets/splashVIew.dart';
import 'package:spotify_app/serviceLocator.dart';
import 'package:spotify_app/simpleObservel.dart';

void main() async {
  Bloc.observer = SimpleBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await inisializeDebend();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, mode) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: AppTheme.lightTheme,
            themeMode: mode,
            darkTheme: ThemeData.dark(),
            home: const SafeArea(child: Splashview()),
          );
        },
      ),
    );
  }
}
