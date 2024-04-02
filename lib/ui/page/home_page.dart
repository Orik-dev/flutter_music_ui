import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_music_ui/bloc/player_bloc/player_bloc.dart';
import 'package:flutter_music_ui/models/audio_file_model.dart';
import 'package:flutter_music_ui/repository/music_list.dart';
import 'package:flutter_music_ui/routes/app_routes.dart';
import 'package:flutter_music_ui/ui/utils/app_colors.dart';
import 'package:flutter_music_ui/ui/utils/image_constants.dart';
import 'package:flutter_music_ui/ui/widgets/custom_bottom_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static Widget builder(BuildContext context) {
    return const HomePage();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerBloc, PlayerState>(builder: (context, state) {
      return Scaffold(
        bottomNavigationBar: const CustomBottomBar(),
        extendBody: true,
        body: Padding(
          padding: const EdgeInsets.only(left:20.0,right: 20,top: 68, bottom: 59),
          child: ListView.builder(
            itemCount: musicList.length,
            // shrinkWrap: true,
            // itemExtent: 80.h,
            itemBuilder: (BuildContext context, int index) {
              final music = musicList[index];
              return InkWell(
                onTap: () {
                  context
                      .read<PlayerBloc>()
                      .add(OnPlayEvent(file: music.path!));
                  context.read<PlayerBloc>().add(SelectIndexEvent(index));
                  Navigator.pushNamed(context, AppRoutes.playerPage);
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 1).r,
                  child: BlocBuilder<PlayerBloc, PlayerState>(
                    builder: (context, state) {
                      return MusicCard(
                        music: music,
                        selectedIndex: state.selectedIndex,
                        index: index,
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ),
      );
    });
  }
}

class MusicCard extends StatelessWidget {
  const MusicCard({
    super.key,
    required this.music,
    required this.selectedIndex,
    required this.index,
  });

  final AudioFile music;
  final int? selectedIndex;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20).r,
      decoration: selectedIndex == index
          ? ShapeDecoration(
              color: AppColors.boxDecorationDark,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13),
              ),
              shadows: const [
                BoxShadow(
                  color: AppColors.boxDecorationLight,
                  blurRadius: 3,
                  offset: Offset(0, 4),
                  spreadRadius: 0,
                )
              ],
            )
          : const BoxDecoration(
              color: Colors.white,
            ),
      // width: 353.w,
      // height: 120.h,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Image(
              height: 60.h,
              width: 64.77.w,
              image: AssetImage(music.image),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: MediaQuery.of(context).textScaler.scale(1) > 1
                  ? 60.h * MediaQuery.of(context).textScaler.scale(0.9)
                  : 60.h,
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Column(
                  // mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            music.musicName,
                            maxLines: 1,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: AppColors.textTitle,
                              fontSize: 16.sp,
                              fontFamily: 'Sora',
                              fontWeight: FontWeight.w600,
                              height: 1,
                              // height: 0.09,
                              // letterSpacing: 0.48,
                            ),
                          ),
                        ),
                        // const Spacer(
                        //   flex: 3,
                        // ),
                        selectedIndex == index
                            ? SvgPicture.asset(ImageConstant.imgPlay)
                            : SvgPicture.asset(ImageConstant.imgIcPlay),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            music.musicArtist,
                            maxLines: 1,
                            style: TextStyle(
                              color: AppColors.textSubTitle,
                              fontSize: 14.sp,
                              fontFamily: 'Sora',
                              fontWeight: FontWeight.w400,
                              height: 1,
                
                              // height: 0,
                              //     letterSpacing: 0.42,
                            ),
                          ),
                        ),
                        Text(
                          music.time ?? '00:00',
                          style: TextStyle(
                            color: const Color(0xFF818E98),
                            fontSize: 14.sp,
                            fontFamily: 'Sora',
                            fontWeight: FontWeight.w400,
                            height: 1,
                
                            //   height: 0.h,
                            //   letterSpacing: 0.42,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
