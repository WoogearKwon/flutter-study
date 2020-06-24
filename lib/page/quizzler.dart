import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../util/quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade900,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: QuizPage(),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  bool _checkAnswer(bool answer) {
    var myAnswer = answer == quizBrain.getQuizAnswer();
    print(myAnswer ? 'you are right! :)' : 'you are wrong :(');
    return myAnswer;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        _buildQuestionText(),
        _buildSubmitButton('True', Colors.green, true),
        _buildSubmitButton('False', Colors.red, false),
        Row(
          children: <Widget>[
          ],
        )
      ],
    );
  }

  Widget _buildQuestionText() {
    return Expanded(
      flex: 5,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: Text(
            quizBrain.getQuizText(),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSubmitButton(String title, MaterialColor color, bool answer) {
    return  Expanded(
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: FlatButton(
          color: color,
          child: Text(
            title,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
          onPressed: () {
            bool myAnswer = _checkAnswer(answer);
            setState(() {
              quizBrain.nextQuiz();
            });
          },
        ),
      ),
    );
  }
}