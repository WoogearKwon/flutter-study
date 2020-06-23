import 'package:flutter/material.dart';
import 'package:startupnamer/model/subject.dart';
import 'package:startupnamer/route/route_generator.dart';

class StudyList extends StatelessWidget {
  final micard = Subject(
      'Mi Card',
      'To learn how to build basic widget layout & add assets',
      Icons.person,
      Routes.miCard);
  final dicee = Subject(
      'Dicee', 'To learn what stateful widget is', Icons.casino, Routes.dicee);
  final magicball = Subject(
      'MagicBall',
      'To Solidify what you\'ve learnt in the Dicee tutorial',
      Icons.blur_circular,
      Routes.magicBall);
  final xylophone = Subject(
      'Xylophone',
      'To learn how to add package dependencies and to use them',
      Icons.music_note,
      Routes.xylophone);

  final quizzler = Subject(
      'Quizzler',
      'fdfdfd',
      Icons.not_listed_location,
      Routes.quizzler);

  @override
  Widget build(BuildContext context) {
    var list = [
      micard,
      dicee,
      magicball,
      xylophone,
      quizzler,
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
                child: Container(
                  child: Icon(
                    item.icon,
                    size: 30,
                  ),
                ),
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
