import 'package:flutter/material.dart';
import 'questionScreen.dart';
import 'question.dart';

class Game {
  final List<Question> questions;
  final List<QuestionScreen> questionScreens = [];
  late int currentQuestionIndex;
  late int score;
  late final PageController pageController = PageController();

  Game(this.questions){
    for (Question question in questions) {
      questionScreens.add(QuestionScreen(question: question, game: this));
    }
  }

  void showNextQuestion(BuildContext context) {
    currentQuestionIndex ++;
    pageController.nextPage(duration: Duration(milliseconds: 100), curve: Curves.easeInOut);
  }

  void showPrevQuestion(BuildContext context) {
    currentQuestionIndex --;
    pageController.previousPage(duration: Duration(milliseconds: 100), curve: Curves.easeInOut);
  }

  void jumpToQuestion(int questionIndex) {
    currentQuestionIndex = questionIndex;
    pageController.animateToPage(questionIndex, duration: Duration(milliseconds: 100), curve: Curves.bounceIn);
  }

  bool get isFinished => currentQuestionIndex >= questionScreens.length;

  int get finalScore {
    int score = 0;
    for (QuestionScreen questionScreen in questionScreens) {
      score += questionScreen.question.selectedAnswerIndex == questionScreen.question.correctAnswerIndex ? 1 : 0;
    }
    return score;
  }

  void start(BuildContext context) {
    currentQuestionIndex = 0;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PageView(
          controller: pageController,
          children: questionScreens,
        ),
      ),
    );
  }
}
