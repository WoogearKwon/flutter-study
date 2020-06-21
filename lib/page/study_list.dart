import 'package:flutter/material.dart';
import 'package:startupnamer/model/subject.dart';
import 'package:startupnamer/route/route_generator.dart';

class StudyList extends StatelessWidget {
  final _study1 = Subject('Mi Card',
      'To Learn How to Build Basic Widget Layout & add Assets', Routes.miCard);
  final _study2 = Subject('Dicee', 'To Learn Stateful Widget', Routes.dicee);

  @override
  Widget build(BuildContext context) {
    var list = [_study1, _study2];

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
        padding: const EdgeInsets.all(16.0),
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
      onTap: () {
        Navigator.of(context).pushNamed(item.route);
      },
    );
  }
}
