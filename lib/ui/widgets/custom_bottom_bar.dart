import 'package:flutter/material.dart';
import 'package:flutter_music_ui/generated/l10n.dart';
import 'package:flutter_music_ui/routes/app_routes.dart';
import 'package:flutter_music_ui/ui/utils/image_constants.dart';
import 'package:flutter_music_ui/ui/widgets/build_icon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({super.key});

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom:29.0,left: 29,right: 29),
      child: SizedBox(
        width: 337.w,
        height: 100.h,
        child: ClipRRect(
          clipBehavior: Clip.hardEdge,
          borderRadius: BorderRadius.circular(68),
          child: BottomNavigationBar(
            backgroundColor:  Colors.white,
            type: BottomNavigationBarType.fixed,
            selectedLabelStyle: const TextStyle(
              fontFamily: 'Sora',
              fontWeight: FontWeight.bold,
            ),
            unselectedIconTheme: const IconThemeData(
              color: Colors.blue,
            ),
            items: [
              BottomNavigationBarItem(
                icon: BuildIcon(
                  assetName: ImageConstant.imgNavMain,
                  isSelected: _selectedIndex == 0,
                ),
                label: S.of(context).main,
              ),
              BottomNavigationBarItem(
                icon: BuildIcon(
                  assetName: ImageConstant.imgNavSearch,
                  isSelected: _selectedIndex == 1,
                ),
                label: S.of(context).search,
              ),
              BottomNavigationBarItem(
                icon: BuildIcon(
                  assetName: ImageConstant.imgNavFavorites,
                  isSelected: _selectedIndex == 2,
                ),
                label: S.of(context).favorites,
              ),
              BottomNavigationBarItem(
                icon: BuildIcon(
                  assetName: ImageConstant.imgNavPlaylist,
                  isSelected: _selectedIndex == 3,
                ),
                label: 'Playlist',
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
              switch (index) {
                case 0:
                  break;
                case 1:
                  break;
                case 2:
                  Navigator.pushNamed(context, AppRoutes.favoritesPage);
                  break;
                case 3:
                  Navigator.pushReplacementNamed(
                      context, AppRoutes.initialRoute);
                  break;
                default:
              }
            },
          ),
        ),
      ),
    );
  }
}
