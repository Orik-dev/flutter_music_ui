import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_music_ui/bloc/player_bloc/player_bloc.dart';
import 'package:flutter_music_ui/models/audio_file_model.dart';
import 'package:flutter_music_ui/repository/music_list.dart';
import 'package:flutter_music_ui/ui/utils/image_constants.dart';
import 'package:flutter_music_ui/ui/widgets/player_button_widget.dart';
import 'package:flutter_music_ui/ui/widgets/progress_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';

class PlayerPage extends StatelessWidget {
  PlayerPage({super.key});

  static Widget builder(BuildContext context) {
    return PlayerPage();
  }

  final favoriteBox = Hive.box<AudioFile>('favorite_songs');

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
            title: const Text(
              'Now Playing',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF333333),
                fontSize: 24,
                fontFamily: 'Sora',
                fontWeight: FontWeight.w700,
                height: 0.06,
              ),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Container(
                    width: 341.18,
                    height: 310,
                    decoration: ShapeDecoration(
                      image: DecorationImage(
                        image: selectedMusic?.image != null
                            ? AssetImage(selectedMusic!.image)
                            : AssetImage(ImageConstant.imageNotFound),
                        fit: BoxFit.fill,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '${selectedMusic?.musicName}\n',
                                style: const TextStyle(
                                  color: Color(0xFF373E43),
                                  fontSize: 32,
                                  fontFamily: 'Sora',
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0.96,
                                ),
                              ),
                              TextSpan(
                                text: '${selectedMusic?.musicArtist}',
                                style: const TextStyle(
                                  color: Color(0xFF8F9AA3),
                                  fontSize: 16,
                                  fontFamily: 'Sora',
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.48,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          final selectedMusic = musicList[state.selectedIndex!];
                          context.read<PlayerBloc>().add(
                              AddToFavoritesEvent(selectedMusic));
                        },
                        child: BlocBuilder<PlayerBloc, PlayerState>(
                          builder: (context, state) {
                            return SvgPicture.asset(
                              state.isFavourite ? ImageConstant.imgHugeIcon : ImageConstant.imgNavFavorites,
                              width: 32,
                              height: 32,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 40),
                  child: ProgressBarUp(),
                ),
                const PlayerButtonWidget(),
                const SizedBox(
                  height: 50,
                ),
                Image.asset(ImageConstant.frame),
              ],
            ),
          ),
        );
      },
    );
  }
}
