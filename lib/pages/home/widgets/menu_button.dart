import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../themes/color_theme.dart';
import '../../../themes/text_theme.dart';



class MenuButton extends StatelessWidget {
  String menuTitle;
  Color backgroundColor;
  Widget iconWidget;
  dynamic clickAction;
  MenuButton({required this.menuTitle, required this.backgroundColor, required this.iconWidget, required this.clickAction});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: clickAction,
      child: Container(
        width: 165,
        height: 224,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 24,
              left: 24,
              child: Text("$menuTitle", style: home_menuTitle,),
            ),
            iconWidget
          ],
        )
      ),
    );
  }
}
