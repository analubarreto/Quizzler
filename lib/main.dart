import 'package:flutter/material.dart';
import 'question.dart';

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
  // Widgets
  Widget trueIcon = Icon(Icons.check, color: Colors.green);
  Widget falseIcon = Icon(Icons.close, color: Colors.red);

  // Question list
  List<Widget> scoreKeeper = [];
  List<Question> questionBank = [
     Question(q: 'JavaScript was invented in 1997.', a: true, wT: 'Actually JavaScript was created in 1997 by Brendan Eich'),
     Question(q: 'Up until dart and flutter came, JavaScript was the only language used in the web.', a: false, wT: 'Actually no, there were languages like php, java, and python that can also be used in the web'),
     Question(q: 'Flutter was created by facebook.', a: false, wT: 'Nope. Flutter is a framework created by Google.'),
     Question(q: 'Programming languagues are incomprehesible by computers', a: true, wT: 'That one is actually true, computers only understand zeros and ones. All programming languanges are "translated" to binary code.'),
     Question(q: 'The first ever programming language invented was C.', a: true, wT: 'Nope, it\'s onyl one of the most famous ones, the first programming language was created in 1949 and was named Plankalkül')
  ];

  int questionNumber = 0;

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
                questionBank[questionNumber].questionText,
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
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green.shade800,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                setState(() {
                  bool correctAnswer = questionBank[questionNumber].questionAnswer;
                  if (correctAnswer == true) {
                    print('Yup');
                    scoreKeeper.add(
                      trueIcon
                    );
                  } else {
                    print('Nope');
                    scoreKeeper.add(
                      falseIcon
                    );
                  }
                  questionNumber += 1;
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red.shade800,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                setState(() {
                  bool correctAnswer = questionBank[questionNumber].questionAnswer;
                  if (correctAnswer == false) {
                    print('Yup');
                    scoreKeeper.add(
                      trueIcon
                    );
                  } else {
                    print('Nope');
                    scoreKeeper.add(
                      falseIcon
                    );
                  }
                  questionNumber += 1;
                });
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}