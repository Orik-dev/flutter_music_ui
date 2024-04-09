import 'package:flutter/material.dart';
import 'package:flutter_music_ui/generated/l10n.dart';
import 'package:flutter_music_ui/models/audio_file_model.dart';
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
        title:  Text(S.of(context).favorites),
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
            background: const DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            child: ListTile(
              title: Text(song.musicName),
              subtitle: Text(song.musicArtist),
              leading: Image.asset(song.image),
              onTap: () {},
            ),
          );
        },
      ),
    );
  }
}
