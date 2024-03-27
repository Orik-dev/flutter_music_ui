part of 'player_bloc.dart';

abstract class PlayerEvent extends Equatable {
  const PlayerEvent();

  @override
  List<Object> get props => [];
}

class PlayPauseEvent extends PlayerEvent {
  final bool isPlaying;
  final double progress;
  final String file;

  const PlayPauseEvent(
      {required this.isPlaying, required this.file, this.progress = 0.0});

  @override
  List<Object> get props => [isPlaying, file, progress];
}

class OnPlayEvent extends PlayerEvent {
  final bool isPlaying;
  final String file;

  const OnPlayEvent({this.isPlaying = true, required this.file});

  @override
  List<Object> get props => [isPlaying, file];
}

class OnTapPrevEvent extends PlayerEvent {}

class ProgressUpdateEvent extends PlayerEvent {
  final double progress;

  const ProgressUpdateEvent({required this.progress});

  @override
  List<Object> get props => [progress];
}

class SeekToPositionEvent extends PlayerEvent {
  final Duration position;

  const SeekToPositionEvent(this.position);

  @override
  List<Object> get props => [position];
}

class OnTapForwardEvent extends PlayerEvent {}

class OnTapBackwardEvent extends PlayerEvent {}

class SelectIndexEvent extends PlayerEvent {
  final int selectedIndex;

  const SelectIndexEvent(this.selectedIndex);

  @override
  List<Object> get props => [selectedIndex];
}

class AddToFavoritesEvent extends PlayerEvent {
  final AudioFile audioFile;

  const AddToFavoritesEvent(this.audioFile);

  @override
  List<Object> get props => [audioFile];
}
