import 'dart:ui';

import 'package:findet/domain/themes/diagram_colors.dart';

abstract class ThemeColors {
  DiagramColors get diagramColors;
  Color get primaryBlueColor;
  Color get secondaryBlueColor;
  Color get primaryColor;
  Color get primaryTextColor;
  Color get secondaryColor;
  Color get secondaryBGColor;
  Color get menuItemBG;
  Color get appPurple;
  Color get appSecondaryPurple;
  Color get appPurpleTextColor;
  Color get borderColor;
  Color get quoteBackground;
  Color get quoteTextColor;
  Color get appErrorColor;
  Color get defaultGray;
  Color get defaultWhite;
  Color get defaultBlack;
  Color get defaultLightGray;
  Color get defaultDarkGray;
  Color get defaultBorderColor;
  Color get secondaryBorderColor;
}
