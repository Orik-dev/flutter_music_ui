import 'package:flutter/material.dart';
import 'package:flutter_music_ui/models/audio_file_model.dart';
import 'package:flutter_music_ui/routes/app_routes.dart';
import 'package:hive/hive.dart';

class FavoritesPage extends StatelessWidget {
   FavoritesPage({super.key});

  static Widget builder(BuildContext context) {
    return FavoritesPage();
  }

  final Box<AudioFile> favoriteBox = Hive.box<AudioFile>('favorite_songs');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: ListView.builder(
        itemCount: favoriteBox.length,
        itemBuilder: (context, index) {
          final AudioFile song = favoriteBox.getAt(index)!;
          return Dismissible(
            key: Key(song.id.toString()),
            onDismissed: (direction) {
              favoriteBox.delete(song.key);
            },
            direction: DismissDirection.endToStart,
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 20.0),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            child: ListTile(
              title: Text(song.musicName),
              subtitle: Text(song.musicArtist),
              leading: Image.asset(song.image),
              onTap: () {
              },
            ),
          );
        },
      ),
    );
  }
}
