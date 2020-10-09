import 'package:flutter/material.dart';

import 'question.dart';

class QuizzBrain {
  int _questionNumber = 0;
  List<Widget> scoreKeeper = [];

  List<Question> _questionBank = [
     Question('JavaScript was invented in 1997.', 'Actually JavaScript was created in 1997 by Brendan Eich', true),
     Question('Up until dart and flutter came, JavaScript was the only language used in the web.', 'Actually no, there were languages like php, java, and python that can also be used in the web', false),
     Question('Flutter was created by facebook.', 'Nope. Flutter is a framework created by Google.', false),
     Question('Programming languagues are incomprehesible by computers', 'That one is actually true, computers only understand zeros and ones. All programming languanges are "translated" to binary code.', true),
     Question('The first ever programming language invented was C.', 'Nope, it\'s onyl one of the most famous ones, the first programming language was created in 1949 and was named Plankalkül',true),

     Question('Front-End and Back-End are names of programming areas.', 'Yes, yes they are, front-end is where we code the interface and all the interactions with it and back-end is were we talk to the server and database',true),
     Question('Microsoft has never created a programming language.', 'Actually Microsoft is responsible for C, C++ and C# all three programming languages are widly used among developers',false),
     Question('Programmers have to be really good in math', 'It really depends on what you\'re building, actually but mostly no.',false),
     Question('Programming doesn\'t involve creativity at all', 'Well, no... While we do have a lot of techniques and patterns, etc, we do have to be creative to solve problems as problems have different soluitons.',false),
  ];

  var context;
  
  void nextQuestion() {
    if (_questionNumber < (_questionBank.length - 1)) {
      _questionNumber += 1;
    }
  }

  void checkAnswer(bool chosenAnswer, Widget trueIcon, Widget falseIcon) {
    bool correctAnswer = _questionBank[_questionNumber].questionAnswer;
    if (chosenAnswer == correctAnswer) {
      print('Yup');
      scoreKeeper.add(trueIcon);
    } else {
      print('Nope');
      scoreKeeper.add(falseIcon);
    }
  }

  List getScoreKeeper() {
    return scoreKeeper;
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getCorrectAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  bool isFinished() {
    if (_questionNumber >= (_questionBank.length - 1)) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }
}