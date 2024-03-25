import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_music_ui/bloc/player_bloc/player_bloc.dart';

class ProgressBarUp extends StatefulWidget {
  const ProgressBarUp({super.key});

  @override
  State<ProgressBarUp> createState() => _ProgressBarUpState();
}

class _ProgressBarUpState extends State<ProgressBarUp> {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Duration?>(
      stream: context.read<PlayerBloc>().player.durationStream,
      builder: (context, snapshot) {
        final duration = snapshot.data ?? Duration.zero;
        return StreamBuilder<Duration>(
          stream: context.read<PlayerBloc>().player.createPositionStream(),
          builder: (context, snapshot) {
            var position = snapshot.data ?? Duration.zero;
            if (position > duration) {
              position = duration;
            }
            return ProgressBar(
              progress:position,
              total:duration,
              progressBarColor: Colors.blue,
              thumbColor: Colors.blue,
              thumbRadius: 6,
              onSeek: (duration) {
                context.read<PlayerBloc>().add(SeekToPositionEvent(duration));
              },
            );
          },
        );
      },
    );
  }
}
