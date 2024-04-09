// part of 'audio_player_bloc.dart';

// abstract class AudioPlayerEvent extends Equatable {
//   const AudioPlayerEvent();

//   @override
//   List<Object> get props => [];
// }

// class PlayAudio extends AudioPlayerEvent {
//   final bool isPlaying;
//   final double progress;
//   final String file;

//   const PlayAudio(
//       {required this.isPlaying, this.progress = 0.0, required this.file});

//   @override
//   List<Object> get props => [isPlaying, file, progress];
// }

// class PauseAudio extends AudioPlayerEvent {}

// class StopAudio extends AudioPlayerEvent {}

// class SeekAudio extends AudioPlayerEvent {
//   final double seekPercentage;

//   const SeekAudio(this.seekPercentage);
// }
