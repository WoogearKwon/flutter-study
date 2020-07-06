import 'package:flutter/material.dart';
import '../route/route_generator.dart';
import '../model/subject.dart';

class MyStudy {
  static List<Subject> list = [
    Subject(
      'Mi Card: Profile Layout',
      'To learn how to build basic widget layout & add assets',
      Icon(
        Icons.person,
        size: 30,
      ),
      Routes.kMiCard,
    ),
    Subject(
      'Dicee',
      'To learn what stateful widget is',
      Image.asset('images/icon_dicee.png'),
      Routes.kDicee,
    ),
    Subject(
      'MagicBall: Ask Anything',
      'To Solidify what you\'ve learnt in the Dicee tutorial',
      Image.asset('images/icon_magicball.png'),
      Routes.kMagicBall,
    ),
    Subject(
      'Xylophone',
      'To learn how to add package dependencies and to use them',
      Image.asset('images/icon_xylophone.png'),
      Routes.kXylophone,
    ),
    Subject(
      'Quizzler: Quiz Game',
      'To learn how to modularising your code into separate classes(OOP)',
      Image.asset('images/icon_quizzler.png'),
      Routes.kQuizzler,
    ),
    Subject(
      'Destini: Adventure Game',
      'To Solidify what you\'ve learnt from Quizzler to use Dart OOP principles to build a well organized project',
      Image.asset('images/icon_destini.png'),
      Routes.kDestiny,
    ),
    Subject(
      'Timer(Using Bloc)',
      'To learn how to use Bloc Package so that you can separate UI and business logic',
      Icon(Icons.timer),
      Routes.kTimer,
    ),
    Subject(
      'BMI Calculator: A Beautiful Health App',
      'Building Flutter UI for Intermediates',
      Icon(Icons.local_hospital),
      Routes.kSkeleton,
    ),
  ];
}