import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'icon_content.dart';
import 'reusable_card.dart';

const bottomContainerHeight = 80.0;
const activeCardColor = Color(0xFF1D1E33);
const bottomContainerColor = Color(0xFFEB1555);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                ReusableCard(
                  color: activeCardColor,
                  cardChild: IconContent(
                    icon: FontAwesomeIcons.mars,
                    label: 'MALE',
                  ),
                ),
                ReusableCard(
                  color: activeCardColor,
                  cardChild: IconContent(
                    icon: FontAwesomeIcons.venus,
                    label: 'FEMALE',
                  ),
                )
              ],
            )
          ),
          ReusableCard(
            color: activeCardColor,
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                ReusableCard(
                  color: activeCardColor,
                ),
                ReusableCard(
                  color: Color(0xFF1D1E33),
                )
              ],
            ),
          ),
          Container(
            color: bottomContainerColor,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: bottomContainerHeight,
          )
        ],
      )
    );
  }
}