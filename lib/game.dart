import 'package:flutter/material.dart';
import 'package:flutter_test_app/gamePage.dart';
import 'question.dart';
import 'resultsPage.dart';


class Game {
  final List<Question> questions;
  late int currentQuestionIndex;
  late int score;
  late final PageController pageController = PageController();

  Game(this.questions);

  void showNextQuestion(BuildContext context) {
    currentQuestionIndex ++;
    //pageController.nextPage(duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
    jumpToQuestion(currentQuestionIndex);
  }

  void showPrevQuestion(BuildContext context) {
    currentQuestionIndex --;
    //pageController.previousPage(duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
    jumpToQuestion(currentQuestionIndex);
  }

  void jumpToQuestion(int questionIndex) {
    currentQuestionIndex = questionIndex;
    pageController.animateToPage(questionIndex, duration: const Duration(milliseconds: 100), curve: Curves.bounceIn);
  }

  void selectAnswerForQuestion(BuildContext context, int answerIndex) {
    questions[currentQuestionIndex].setSelectedAnswerIndex(answerIndex);
    // Get the score
    if (isFinished()) {
      //Navigator.push(
       // context,
        //MaterialPageRoute(
         // builder: (context) => ResultsPage(score: finalScore, questions: questions),
        //),
      //);
    }
  }


  bool isFinished() {
    for (var question in questions) {
      if (question.selectedAnswerIndex == -1) {
        return false;
      }
    }
    return true;
  }


  int get finalScore {
    int score = 0;
    for (Question question in questions) {
      score += question.selectedAnswerIndex == question.correctAnswerIndex ? 1 : 0;
    }
    return score;
  }

  void start(BuildContext context) {
    currentQuestionIndex = 0;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GamePage(game: this)
      ),
    );
  }

}
