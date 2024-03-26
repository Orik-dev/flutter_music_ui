import 'package:flutter/material.dart';
import 'package:flutter_music_ui/models/audio_file_model.dart';
import 'package:hive/hive.dart';

class FavoritesPage extends StatelessWidget {
  FavoritesPage({Key? key}) : super(key: key);

  final Box<AudioFile> favoriteBox = Hive.box<AudioFile>('favorite_songs');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: ListView.builder(
        itemCount: favoriteBox.length,
        itemBuilder: (context, index) {
          final AudioFile song = favoriteBox.getAt(index)!;
          return ListTile(
            title: Text(song.musicName),
            subtitle: Text(song.musicArtist),
            leading: Image.asset(song.image),
            onTap: () {
              // Действие при нажатии на избранную песню
            },
          );
        },
      ),
    );
  }
}