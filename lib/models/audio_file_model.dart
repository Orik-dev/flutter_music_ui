import 'package:flutter/material.dart';
import 'package:flutter_music_ui/ui/utils/image_constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';

part 'audio_file_model.g.dart';

@HiveType(typeId: 0)
class AudioFile extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String image ;
  @HiveField(2)
  final String imgTime;
  @HiveField(3)
  final String musicName;
  @HiveField(4)
  final String musicArtist;
  @HiveField(5)
  final String? path;
  late int? isFavourite;
  late String? time;

  AudioFile(  {
    required this.path,
    required this.id,
    required this.image,
    required this.imgTime,
    required this.musicName,
    required this.musicArtist,
  });

  Future<void> addToFavorites() async {
    isFavourite = 1;
    await save();
  }

  Future<void> removeFromFavorites() async {
    isFavourite = 0;
    await save();
  }

}
