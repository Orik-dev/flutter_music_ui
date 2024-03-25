part of 'player_bloc.dart';

enum SongStatus { playing, pause, stopped }

class PlayerState extends Equatable {
  final bool isPlaying;
  final double progress;
  final bool isFavourite;
  final String? file;
  final SongStatus status;
  final int? selectedIndex;

  const PlayerState({
    this.isPlaying = true,
    this.isFavourite = false,
    this.progress = 0.0,
    this.status = SongStatus.stopped,
    this.file,
    this.selectedIndex,
  });

  PlayerState copyWith({
    bool? isPlaying,
    double? progress,
    bool? isFavourite,
    SongStatus? status,
    String? file,
    int? selectedIndex,
  }) {
    return PlayerState(
      isFavourite: isFavourite ?? this.isFavourite,
      isPlaying: isPlaying ?? this.isPlaying,
      progress: progress ?? this.progress,
      status: status ?? this.status,
      file: file ?? this.file,
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }

  @override
  List<Object> get props =>
      [isPlaying, progress, isFavourite, status, file ?? '',selectedIndex ?? -1];
}
