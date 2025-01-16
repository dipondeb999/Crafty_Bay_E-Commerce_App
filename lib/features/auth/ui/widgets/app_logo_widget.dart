import 'package:crafty_bay_ecommerce_project/app/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppLogoWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final BoxFit? boxFit;

  const AppLogoWidget({super.key, this.width, this.height, this.boxFit});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AssetsPath.appLogoSvg,
      width: width ?? 120,
      height: height ?? 120,
      fit: boxFit ?? BoxFit.scaleDown,
    );
  }
}
