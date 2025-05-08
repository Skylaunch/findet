import 'dart:ui';

abstract class DiagramColors {
  Color get firstItemColor;
  Color get secondItemColor;
  Color get thirdItemColor;
  Color get fourthItemColor;
  Color get fifthItemColor;
  Color get sixthItemColor;
  Color get seventhItemColor;
  Color get eighthItemColor;
  Color get ninthItemColor;
  Color get tenthItemColor;

  List<Color> toPalette() => [
        firstItemColor,
        secondItemColor,
        thirdItemColor,
        fourthItemColor,
        fifthItemColor,
        sixthItemColor,
        seventhItemColor,
        eighthItemColor,
        ninthItemColor,
        tenthItemColor,
      ];
}
