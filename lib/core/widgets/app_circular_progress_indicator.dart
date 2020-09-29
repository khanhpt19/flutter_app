import 'package:flutter/material.dart';
import 'package:flutter_app/core/theme/app_colors.dart';

import 'app_image_rotater.dart';
import 'index.dart';

class AppCircularProgressIndicator extends StatelessWidget {
  final Color color;
  final double sizePercent;

  AppCircularProgressIndicator(
      {this.color = AppColors.black, this.sizePercent = 1});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AppImageRotater(
          imagePath: "assets/images/icon_app.png",
          sizePercent: this.sizePercent,
          animationDuration: Duration(milliseconds: 7500),
          opacity: .2,
          color: color,
        ),
        AppImageRotater(
          imagePath: "assets/images/icon_app.png",
          opacity: .5,
          sizePercent: this.sizePercent / this.convertSize(4),
          color: color,
          animateToReverse: true,
          animationDuration: Duration(milliseconds: 1250),
        ),
      ],
    );
  }
}
