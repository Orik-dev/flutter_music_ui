
import 'package:hive/hive.dart';

part 'audio_file_model.g.dart';

@HiveType(typeId: 0)
class AudioFile extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String image ;
  @HiveField(2)
  final String? time;
  @HiveField(3)
  final String musicName;
  @HiveField(4)
  final String musicArtist;
  @HiveField(5)
  final String? path;


  AudioFile(  {
    required this.path,
    required this.id,
    required this.image,
    required this.time,
    required this.musicName,
    required this.musicArtist,
  });


}
