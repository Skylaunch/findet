import 'package:findet/data/themes/diagram_colors.dart/dark_diagram_colors.dart';
import 'package:findet/domain/themes/diagram_colors.dart';
import 'package:findet/domain/themes/theme_colors.dart';
import 'package:flutter/material.dart';

class DarkThemeColors implements ThemeColors {
  @override
  Color get primaryBlueColor => const Color(0xff539DF3);

  @override
  Color get defaultGray => const Color(0xff8f9098);

  @override
  Color get secondaryBorderColor => const Color.fromARGB(255, 106, 96, 96);

  @override
  Color get defaultBorderColor => const Color(0xff491b6d);

  @override
  Color get defaultWhite => const Color(0xffffffff);

  @override
  Color get defaultBlack => const Color(0xff000000);

  @override
  Color get menuItemBG => const Color(0xff646464);

  @override
  Color get defaultDarkGray => const Color(0xff494a50);

  @override
  Color get defaultLightGray => const Color(0xff646464);

  @override
  Color get secondaryBlueColor => const Color(0xffB4DBFF);

  @override
  Color get secondaryColor => const Color(0xffa09b9b);

  @override
  Color get secondaryBGColor => const Color(0xff646464);

  @override
  Color get primaryColor => const Color(0xff191D23);

  @override
  Color get primaryTextColor => const Color(0xfff3f3f3);

  @override
  Color get appPurple => const Color(0xFFBD98EA);

  @override
  Color get borderColor => const Color(0xffC5C6CC);

  @override
  Color get quoteBackground => const Color(0xffD0CFF3);

  @override
  Color get appSecondaryPurple => const Color(0xffD0CFF3);
  
  @override
  Color get appPurpleTextColor => const Color(0xffD0CFF3);

  @override
  Color get quoteTextColor => const Color(0xff494A50);

  @override
  Color get appErrorColor => Colors.red;

  @override
  DiagramColors get diagramColors => DarkDiagramColors();
}
