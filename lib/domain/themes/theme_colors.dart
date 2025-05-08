import 'dart:ui';

import 'package:findet/domain/themes/diagram_colors.dart';

abstract class ThemeColors {
  DiagramColors get diagramColors;
  Color get primaryBlueColor;
  Color get secondaryBlueColor;
  Color get primaryColor;
  Color get secondaryColor;
  Color get appPurple;
  Color get appSecondaryPurple;
  Color get borderColor;
  Color get quoteBackground;
  Color get quoteTextColor;
}
