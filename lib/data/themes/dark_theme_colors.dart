import 'dart:ui';

import 'package:findet/data/themes/diagram_colors.dart/dark_diagram_colors.dart';
import 'package:findet/domain/themes/diagram_colors.dart';
import 'package:findet/domain/themes/theme_colors.dart';

class DarkThemeColors implements ThemeColors {
  @override
  Color get primaryBlueColor => const Color(0xff539DF3);

  @override
  Color get secondaryBlueColor => const Color(0xffB4DBFF);

  @override
  Color get secondaryColor => const Color(0xff646464);

  @override
  Color get primaryColor => const Color(0xff191D23);

  @override
  Color get appPurple => const Color(0xFFBD98EA);

  @override
  Color get borderColor => const Color(0xffC5C6CC);

  @override
  Color get quoteBackground => const Color(0xffD0CFF3);

  @override
  Color get appSecondaryPurple => const Color(0xffD0CFF3);

  @override
  Color get quoteTextColor => const Color(0xff494A50);

  @override
  DiagramColors get diagramColors => DarkDiagramColors();
}
