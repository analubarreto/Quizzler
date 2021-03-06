import 'package:flutter/material.dart';
import 'components/GameButton.dart';
import 'quizzBrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizzBrain quizzBrain = QuizzBrain();
void main() {
  runApp(Quizzler());
}

class Quizzler extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quizzler',
      home: Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage()
          )
        )
      )
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  Widget trueIcon = Icon(Icons.check, color: Colors.green);
  Widget falseIcon = Icon(Icons.close, color: Colors.red);

  void playingThegame () {
    quizzBrain.checkAnswer(true, trueIcon, falseIcon);
    if (quizzBrain.isFinished()) {
      Alert(context: context, title: "Game Over", desc: "You've Finished the Game.").show();
      quizzBrain.reset();
      quizzBrain.scoreKeeper = [];
    } else {
      quizzBrain.nextQuestion();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizzBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.grey.shade900,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: GameButton(
              btnText: 'True',
              btnColor: Colors.green.shade800,
              trueIcon: trueIcon,
              falseIcon: falseIcon,
              onPress: () => {
                setState(() => {
                  playingThegame()
                })
              },  
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: GameButton(
              btnText: 'False',
              btnColor: Colors.red.shade800,
              trueIcon: trueIcon,
              falseIcon: falseIcon,
              onPress: () => {
                setState(() => {
                  playingThegame()
                })
              },  
            ),
          ),
        ),
        Row(
          children: quizzBrain.getScoreKeeper(),
        )
      ],
    );
  }
}