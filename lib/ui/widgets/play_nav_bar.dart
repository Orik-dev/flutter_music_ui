import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_music_ui/bloc/player_bloc/player_bloc.dart';
import 'package:flutter_music_ui/ui/utils/image_constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PlayNavBar extends StatelessWidget {
  const PlayNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerBloc, PlayerState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(29.0),
          child: ClipRRect(
            clipBehavior: Clip.hardEdge,
            borderRadius: BorderRadius.circular(30),
            child: Container(
              width: 335,
              height: 84,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(68),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x266E7880),
                    blurRadius: 20,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Image(
                      height: 60,
                      width: 64.77,
                      image: AssetImage(ImageConstant.group),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(left: 16),
                      height: 38,
                      width: 83,
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Dynamite',
                            style: TextStyle(
                              color: Color(0xFF373E43),
                              fontSize: 16,
                              fontFamily: 'Sora',
                              fontWeight: FontWeight.w600,
                              height: 0,
                              letterSpacing: 0.48,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'BTS',
                            style: TextStyle(
                              color: Color(0xFF8E9AA3),
                              fontSize: 12,
                              fontFamily: 'Sora',
                              fontWeight: FontWeight.w400,
                              height: 0.11,
                              letterSpacing: 0.36,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 60,
                  ),
                  Expanded(
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            ImageConstant.imgHugeIcon,
                            height: 24,
                            width: 24,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          IconButton(
                              onPressed: () {
                                if (state.isPlaying) {
                                  context.read<PlayerBloc>().add(
                                    const PlayPauseEvent(
                                        isPlaying: false, file: ''),
                                  );
                                } else {
                                  context.read<PlayerBloc>().add(
                                    const PlayPauseEvent(
                                        isPlaying: true, file: ''),
                                  );
                                }
                              },
                              icon: state.isPlaying ? SvgPicture.asset(
                                ImageConstant.imgMultimediaWhite,
                                color: Colors.grey,
                                height: 24,
                                width: 24,
                              ) : const Icon(
                                Icons.play_circle,
                                size: 24,
                                color: Colors.grey,
                              ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
