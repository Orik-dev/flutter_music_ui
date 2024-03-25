import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_music_ui/bloc/player_bloc/player_bloc.dart';
import 'package:flutter_music_ui/models/audio_file_model.dart';
import 'package:flutter_music_ui/routes/app_routes.dart';
import 'package:flutter_music_ui/ui/page/player_page.dart';
import 'package:flutter_music_ui/ui/page/home_page.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:just_audio/just_audio.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteBox = Hive.box<AudioFile>('favorite_songs');
    final AudioPlayer player = AudioPlayer();
    return BlocProvider(
      create: (context) => PlayerBloc(player: player, favoriteBox: favoriteBox),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Test app',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
          ),
          useMaterial3: true,
        ),
        home: const HomePage(),
        initialRoute: AppRoutes.initialRoute,
        routes: AppRoutes.routes,
      ),
    );
  }
}
