import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BuildIcon extends StatelessWidget {
  const BuildIcon({super.key, required this.assetName, required this.isSelected});
  final String  assetName;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetName,
      colorFilter: ColorFilter.mode(isSelected ? Colors.blue : const Color(0xFFD2D7DA), BlendMode.srcIn)   
    );
  }
}