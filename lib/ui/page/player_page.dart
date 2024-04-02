import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_music_ui/bloc/player_bloc/player_bloc.dart';
import 'package:flutter_music_ui/models/audio_file_model.dart';
import 'package:flutter_music_ui/repository/music_list.dart';
import 'package:flutter_music_ui/ui/utils/image_constants.dart';
import 'package:flutter_music_ui/ui/widgets/player_button_widget.dart';
import 'package:flutter_music_ui/ui/widgets/progress_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';

class PlayerPage extends StatefulWidget {
  const PlayerPage({super.key});

  static Widget builder(BuildContext context) {
    return const PlayerPage();
  }

  @override
  State<PlayerPage> createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  late Box<AudioFile> favoriteBox;
  @override
  void initState() {
    super.initState();
    favoriteBox = Hive.box<AudioFile>('favorite_songs');
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerBloc, PlayerState>(
      builder: (context, state) {
        final selectedMusic = state.selectedIndex != null
            ? musicList[state.selectedIndex!]
            : null;
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 20,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            title: Text(
              'Now Playing',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFF333333),
                fontSize: 24.sp,
                fontFamily: 'Sora',
                fontWeight: FontWeight.w700,
                height: 1,
              ),
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 341.18.w,
                  height: 310.h,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: selectedMusic?.image != null
                          ? AssetImage(selectedMusic!.image)
                          : AssetImage(ImageConstant.imageNotFound),
                      fit: BoxFit.fill,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.w),
                    ),
                  ),
                ),
                SizedBox(height: 35.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                            '${selectedMusic?.musicName}',
                            style: TextStyle(
                              color: const Color(0xFF373E43),
                              fontSize: 32.sp,
                              fontFamily: 'Sora',
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.96,
                              height: 32.sp / 40.sp,
                            ),
                          ),
                        
                        SizedBox(height: 12.h),
                        Text(
                          '${selectedMusic?.musicArtist}',
                          style: TextStyle(
                            color: const Color(0xFF8F9AA3),
                            fontSize: 16.sp,
                            fontFamily: 'Sora',
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.48,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    BlocBuilder<PlayerBloc, PlayerState>(
                      builder: (context, state) {
                        return InkWell(
                          onTap: () {
                            final selectedMusic =
                                musicList[state.selectedIndex!];
                            context
                                .read<PlayerBloc>()
                                .add(AddToFavoritesEvent(selectedMusic));
                          },
                          child: SvgPicture.asset(
                            favoriteBox.values.contains(selectedMusic)
                                ? ImageConstant.imgHugeIcon
                                : ImageConstant.imgNavFavorites,
                            width: 32.w,
                            height: 32.h,
                          ),
                        );
                      },
                    ),
                  ],
                ),
                const ProgressBarUp(),
                SizedBox(height: 78.44.h,),
                const PlayerButtonWidget(),
                // Expanded(
                //   child: Image.asset(
                //     ImageConstant.frame,
                //     height: 62.h,
                //     width: 42.w,
                //   ),
                // ),
              ],
            ),
          ),
        );
      },
    );
  }
}
