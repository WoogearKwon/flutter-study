import 'package:flutter/material.dart';
import 'package:startupnamer/model/subject.dart';
import 'package:startupnamer/util/my_study_list.dart';

class StudyListPage extends StatelessWidget {
  final MyStudy _myStudy = MyStudy();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Study List'),
      ),
      body: SafeArea(
        child: _getList(_myStudy.getStudyList()),
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
