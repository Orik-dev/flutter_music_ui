import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_music_ui/bloc/player_bloc/player_bloc.dart';
import 'package:flutter_music_ui/ui/utils/image_constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PlayerButtonWidget extends StatelessWidget {
  const PlayerButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerBloc, PlayerState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Shuffle
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(ImageConstant.imgHugeIconMultimedia),
            ),
            const SizedBox(width: 30),
            // Backward
            IconButton(
              onPressed: () {
                context.read<PlayerBloc>().add(OnTapBackwardEvent());
              },
              icon: SvgPicture.asset(
                ImageConstant.imgHugeIconMultimediaBlue400,
              ),
            ),
            // Play/Pause
            IconButton(
              onPressed: () {
                if (state.isPlaying) {
                  context.read<PlayerBloc>().add(
                        const PlayPauseEvent(isPlaying: false, file: ''),
                      );
                } else {
                  context.read<PlayerBloc>().add(
                        const PlayPauseEvent(isPlaying: true, file: ''),
                      );
                }
              },
              icon: state.isPlaying
                  ? Image.asset(ImageConstant.pauseBlue)
                  : const Icon(
                      Icons.play_circle,
                      size: 80,
                      color: Colors.blue,
                    ),
            ),
            // Forward
            IconButton(
              onPressed: () {
                context.read<PlayerBloc>().add(OnTapForwardEvent());
              },
              icon: Image.asset(ImageConstant.nextForward),
            ),
            const SizedBox(width: 30),
            // Repeat
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                ImageConstant.imgHugeIconMultimediaBlueGray200,
              ),
            ),
          ],
        );
      },
    );
  }
}
