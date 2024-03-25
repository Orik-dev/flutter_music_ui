import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_music_ui/models/audio_file_model.dart';
import 'package:flutter_music_ui/repository/music_list.dart';
import 'package:hive/hive.dart';
import 'package:just_audio/just_audio.dart';

part 'player_event.dart';

part 'player_state.dart';

class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  final AudioPlayer player;
  final Box<AudioFile> favoriteBox;
  bool isPlaying = false;
  Timer? timer;

  PlayerBloc({
    required this.player,
    required this.favoriteBox,
}) : super( const PlayerState()) {
    on(_onPlayPauseEvent);
    on(_onPlayEvent);
    on<SelectIndexEvent>(_onSelectIndexEvent);
    // on(_progressUpdate);
    on(_onTapForwardEvent);
    on(_onTapBackwardEvent);
    on(_onSeekToPositionEvent);
  }

  Future<void> _onPlayPauseEvent(
      PlayPauseEvent event, Emitter<PlayerState> emit) async {
    if (isPlaying) {
      player.pause();
    } else {
      player.play();
    }
    emit(state.copyWith(
      isPlaying: !isPlaying,
    ));
    isPlaying = !isPlaying;
  }

  Future<void> _onPlayEvent(
      OnPlayEvent event, Emitter<PlayerState> emit) async {
    await player.setAsset(event.file);
    player.play();
    isPlaying = true;
    double progress = 0.0;
    emit(state.copyWith(
        isPlaying: true,
        // isFavourite: event.file.isFavourite == 1,
        status: SongStatus.playing,
        file: event.file));
    Timer.periodic(const Duration(milliseconds: 1), (timer) {
      progress = player.duration == null
          ? 0.0
          : player.position.inMilliseconds / player.duration!.inMilliseconds;
      add(ProgressUpdateEvent(progress: progress));
      if (progress >= 1.0) {
        timer.cancel();
      }
    });
  }

  // Future<void> _progressUpdate(
  //     ProgressUpdateEvent event, Emitter<PlayerState> emit) async {
  //   if (event.progress == 1.0) {
  //     // player.pause();
  //     // player.seek(const Duration(seconds: 0));
  //     // emit(state.copyWith(progress: 0.0,isPlaying: false));
  //     add(OnPlayEvent(file: state.file!));
  //   } else {
  //     emit(state.copyWith(
  //       progress: event.progress,
  //     ));
  //   }
  // }


  void _onTapForwardEvent(OnTapForwardEvent event, Emitter<PlayerState> emit) {
    if (player.position.inSeconds < player.duration!.inSeconds - 10) {
      player.seek(Duration(seconds: player.position.inSeconds + 10));
      emit(state.copyWith(
          progress: player.position.inMilliseconds /
              player.duration!.inMilliseconds));
    }
  }

  void _onTapBackwardEvent(
      OnTapBackwardEvent event, Emitter<PlayerState> emit) {
    if (player.position.inSeconds > 10) {
      player.seek(Duration(seconds: player.position.inSeconds - 10));
    } else {
      player.seek(const Duration(seconds: 0));
    }
    emit(state.copyWith(
        progress:
            player.position.inMilliseconds / player.duration!.inMilliseconds));
  }

  Future<void> _onSeekToPositionEvent(
      SeekToPositionEvent event, Emitter<PlayerState> emit) async {
    player.seek(event.position);
  }

  void _onSelectIndexEvent(SelectIndexEvent event, Emitter<PlayerState> emit) {
    // В этом методе вы можете обновить состояние блока в зависимости от выбранного индекса
    final newIndex = event.selectedIndex;

    // Например, вы можете установить новый индекс в состоянии блока
    emit(state.copyWith(selectedIndex: newIndex));
  }

  Stream<PlayerState> mapEventToState(PlayerEvent event) async* {
    if (event is SelectIndexEvent) {
      yield state.copyWith(selectedIndex: event.selectedIndex);
    }
    // Другие события...
  }

}