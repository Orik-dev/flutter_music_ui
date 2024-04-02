import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_music_ui/bloc/player_bloc/player_bloc.dart';
import 'package:flutter_music_ui/repository/music_list.dart';
import 'package:flutter_music_ui/routes/app_routes.dart';
import 'package:flutter_music_ui/ui/widgets/custom_bottom_bar.dart';
import 'package:flutter_music_ui/ui/widgets/music_card.dart';


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
          padding: const EdgeInsets.all(20),
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
                child: BlocBuilder<PlayerBloc, PlayerState>(
                  builder: (context, state) {
                    return MusicCard(
                      music: music,
                      selectedIndex: state.selectedIndex,
                      index: index,
                    );
                  },
                ),
              );
            },
          ),
        ),
      );
    });
  }
}


