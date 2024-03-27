// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_file_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AudioFileAdapter extends TypeAdapter<AudioFile> {
  @override
  final int typeId = 0;

  @override
  AudioFile read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AudioFile(
      path: fields[5] as String?,
      id: fields[0] as int,
      image: fields[1] as String,
      time: fields[2] as String?,
      musicName: fields[3] as String,
      musicArtist: fields[4] as String,
      isFavourite: fields[6] == null ? false : fields[6] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, AudioFile obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.time)
      ..writeByte(3)
      ..write(obj.musicName)
      ..writeByte(4)
      ..write(obj.musicArtist)
      ..writeByte(5)
      ..write(obj.path)
      ..writeByte(6)
      ..write(obj.isFavourite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AudioFileAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
