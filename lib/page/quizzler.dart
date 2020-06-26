import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../util/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

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

  /// check your answer and show its result on below the button
  void _checkAnswer(bool answer) {
    setState(() {
      if (quizBrain.isFinished()) showAlert('Finished', 'You\'ve reached the end of the quiz.');
      else {
        bool myAnswer = answer == quizBrain.getQuizAnswer();
        scoreKeeper.add(myAnswer
            ? Icon(Icons.check, color: Colors.green,)
            : Icon(Icons.close, color: Colors.red,));

        quizBrain.nextQuiz();
      }
    });
  }

  void showAlert(String title, String desc) {
    /// we added this new package in pubspec.yaml
    Alert(
      context: context,
      title: title,
      desc: desc,
    ).show();

    quizBrain.reset();
    scoreKeeper = [];
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
          children: scoreKeeper
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
            _checkAnswer(answer);
          },
        ),
      ),
    );
  }
}