import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_music_ui/bloc/player_bloc/player_bloc.dart';
import 'package:flutter_music_ui/ui/utils/image_constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PlayerButtonWidget extends StatelessWidget {
  const PlayerButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerBloc, PlayerState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            // Shuffle
            IconButton(
              onPressed: () {},
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              style: const ButtonStyle(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              icon: SvgPicture.asset(
                ImageConstant.imgHugeIconMultimedia,
                width: 32.w,
                height: 32.w,
                fit: BoxFit.fitWidth,
              ),
            ),
            const SizedBox(width: 37),
            // Backward
            IconButton(
              onPressed: () {
                context.read<PlayerBloc>().add(OnTapBackwardEvent());
              },
              icon: SvgPicture.asset(
                ImageConstant.imgHugeIconMultimediaBlue400,
              ),
            ),
            SizedBox(width: 32.h,),
            // Play/Pause
            SizedBox(
              height: 72.w,
              width: 72.w,
              child: IconButton(
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
                    : DecoratedBox(
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(72.w)),
                        child: Center(
                          child: Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 36.w,
                          ),
                        ),
                      ),
              ),
            ),
             SizedBox(width: 32.h,),
            // Forward
            IconButton(
              onPressed: () {
                context.read<PlayerBloc>().add(OnTapForwardEvent());
              },
              icon: Image.asset(ImageConstant.nextForward),
            ),
            const SizedBox(width: 32),
            // Repeat
            IconButton(
              onPressed: () {},
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              style: const ButtonStyle(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              icon: SvgPicture.asset(
                ImageConstant.imgHugeIconMultimediaBlueGray200,
                width: 32.w,
                height: 32.w,
                // fit: BoxFit.fitWidth,
              ),
            ),
          ],
        );
      },
    );
  }
}
