import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_music_ui/bloc/player_bloc/player_bloc.dart';
import 'package:flutter_music_ui/repository/music_list.dart';
import 'package:flutter_music_ui/routes/app_routes.dart';
import 'package:flutter_music_ui/ui/utils/app_colors.dart';
import 'package:flutter_music_ui/ui/utils/image_constants.dart';
import 'package:flutter_music_ui/ui/widgets/custom_bottom_bar.dart';
import 'package:flutter_music_ui/ui/widgets/play_nav_bar.dart';
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
        bottomNavigationBar:
        state.selectedIndex != null ? const PlayNavBar() : const CustomBottomBar(),
        extendBody: true,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
            itemCount: musicList.length,
            itemExtent: 80,
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
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                  child: Container(
                    decoration: state.selectedIndex == index
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
                    width: 353,
                    height: 60,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Image(
                            height: 60,
                            width: 64.77,
                            image: AssetImage(music.image),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.only(left: 16),
                            height: 49,
                            width: 275,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      music.musicName,
                                      style: const TextStyle(
                                        color: AppColors.textTitle,
                                        fontSize: 16,
                                        fontFamily: 'Sora',
                                        fontWeight: FontWeight.w600,
                                        height: 0.09,
                                        letterSpacing: 0.48,
                                      ),
                                    ),
                                    const Spacer(
                                      flex: 3,
                                    ),
                                    Expanded(
                                      child: state.selectedIndex == index
                                          ? SvgPicture.asset(
                                              ImageConstant.imgPlay)
                                          : SvgPicture.asset(
                                              ImageConstant.imgIcPlay),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Row(
                                  children: [
                                    Text(
                                      music.musicArtist,
                                      style: const TextStyle(
                                        color: AppColors.textSubTitle,
                                        fontSize: 14,
                                        fontFamily: 'Sora',
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                        letterSpacing: 0.42,
                                      ),
                                    ),
                                    const Spacer(
                                      flex: 3,
                                    ),
                                    Expanded(
                                      child: Image(
                                        image: AssetImage(
                                            ImageConstant.imgTimePlayer),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
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
