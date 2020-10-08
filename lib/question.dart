class Question {
  String questionText;
  String wrongAnswerText;
  bool questionAnswer;

  Question({ String q, String wT, bool a }) {
    questionText = q;
    wrongAnswerText = wT;
    questionAnswer = a;
  }
}