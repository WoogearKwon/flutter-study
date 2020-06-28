import 'package:flutter/material.dart';
import 'package:startupnamer/model/subject.dart';
import 'package:startupnamer/route/route_generator.dart';

class StudyList extends StatelessWidget {
  final micard = Subject(
      'Mi Card: Profile Layout',
      'To learn how to build basic widget layout & add assets',
      Icon(
        Icons.person,
        size: 30,
      ),
      Routes.miCard);
  final dicee = Subject(
      'Dicee', 'To learn what stateful widget is',
      Image.asset('images/icon_dicee.png'),
      Routes.dicee);
  final magicball = Subject(
      'MagicBall: Ask Anything',
      'To Solidify what you\'ve learnt in the Dicee tutorial',
      Image.asset('images/icon_magicball.png'),
      Routes.magicBall);
  final xylophone = Subject(
      'Xylophone',
      'To learn how to add package dependencies and to use them',
      Image.asset('images/icon_xylophone.png'),
      Routes.xylophone);

  final quizzler = Subject(
      'Quizzler: Quiz Game',
      'To learn how to modularising your code into separate classes(OOP)',
      Image.asset('images/icon_quizzler.png'),
      Routes.quizzler);

  final destiny = Subject(
      'Destini: Adventure Game',
      'To Solidify what you\'ve learnt from Quizzler to use Dart OOP principles to build a well organized project',
      Image.asset('images/icon_destini.png'),
      Routes.destiny);

  @override
  Widget build(BuildContext context) {
    var list = [
      micard,
      dicee,
      magicball,
      xylophone,
      quizzler,
      destiny,
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Study List'),
      ),
      body: SafeArea(
        child: _getList(list),
      ),
    );
  }

  Widget _getList(List items) {
    return ListView.separated(
      itemBuilder: (context, index) {
        Subject item = items[index];
        return _getListItem(item, context);
      },
      separatorBuilder: (context, index) {
        return Container(
          height: 5,
          color: Colors.grey[300],
        );
      },
      itemCount: items.length,
    );
  }

  Widget _getListItem(Subject item, BuildContext context) {
    return GestureDetector(
      child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: item.icon,
              ),
              Expanded(
                flex: 10,
                child: Container(
                  margin: const EdgeInsets.only(left: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        item.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        item.description,
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )),
      onTap: () {
        Navigator.of(context).pushNamed(item.route);
      },
    );
  }
}
