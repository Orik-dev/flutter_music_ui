import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_music_ui/app.dart';
import 'package:flutter_music_ui/models/audio_file_model.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
  ));

  //Hive local bd
  await Hive.initFlutter();
  Hive.registerAdapter(AudioFileAdapter());
  await Hive.openBox<AudioFile>('favorite_songs');

  var box = Hive.box<AudioFile>('favorite_songs');
  for (var i = 0; i < box.length; i++) {
    var audioFile = box.getAt(i);
    if (audioFile != null) {
      audioFile.isFavourite = false; // Или любое другое значение по умолчанию
      await box.putAt(i, audioFile);
    }
  }

  runApp(const MyApp());
}

