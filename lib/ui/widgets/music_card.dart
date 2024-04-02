import 'package:flutter/material.dart';
import 'package:flutter_music_ui/models/audio_file_model.dart';
import 'package:flutter_music_ui/ui/utils/app_colors.dart';
import 'package:flutter_music_ui/ui/utils/image_constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

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
    return SizedBox(
      child: DecoratedBox(
        // padding: const EdgeInsets.all(20).r,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color:
              selectedIndex == index ? AppColors.boxDecorationDark : Colors.white,
        ),
        // width: 353.w,
        // height: 120.h,
        child: Padding(
          
      padding: const EdgeInsets.all(10.0).r,
          child: Row(
            children: [
              Image(
                height: 60.h,
                width: 64.77.w,
                image: AssetImage(music.image),
              ),
              Expanded(
                child: SizedBox(
                  height: MediaQuery.of(context).textScaler.scale(1) > 1
                      ? 55.h * MediaQuery.of(context).textScaler.scale(0.9)
                      : 55.h,
                  child: Padding(
                    padding: EdgeInsets.only(left: 11.45.w,right: 11.w),
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
        ),
      ),
    );
  }
}
