import 'package:flutter/material.dart';
import 'package:flutter_music_ui/ui/utils/image_constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({super.key});

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  int _selectedIndex = 3;


  @override
  Widget build(BuildContext context) {
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
          child: BottomNavigationBar(
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
                icon: _buildIcon(ImageConstant.imgNavMain, _selectedIndex == 0),
                label: 'Main',
              ),
              BottomNavigationBarItem(
                  icon: _buildIcon(
                      ImageConstant.imgNavSearch, _selectedIndex == 1),
                  label: 'Search'),
              BottomNavigationBarItem(
                  icon: _buildIcon(
                      ImageConstant.imgNavFavorites, _selectedIndex == 2),
                  label: 'Favorites'),
              BottomNavigationBarItem(
                  icon: _buildIcon(
                      ImageConstant.imgNavPlaylist, _selectedIndex == 3),
                  label: 'Playlist'),
            ],
            currentIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}

Widget _buildIcon(String assetName, bool isSelected) {
  return SvgPicture.asset(
    assetName,
    color: isSelected ? Colors.blue : const Color(0xFFD2D7DA),
  );
}
