import 'package:flutter/material.dart';
import 'question.dart';
import 'game.dart';

class QuestionPanel extends StatefulWidget {
  final Question question;
  final Game game;
  final Function(int) onAnswerSelected;

  const QuestionPanel(
  { super.key,
    required this.question,
    required this.game,
    required this.onAnswerSelected
  });

  @override
  _QuestionPanelState createState() => _QuestionPanelState();
}

class _QuestionPanelState extends State<QuestionPanel> {
  late List<bool> isButtonSelected;

  @override
  Widget build(BuildContext context) {

    int selectedIndex = widget.question.selectedAnswerIndex;
    isButtonSelected = [false, false, false, false];
    if (selectedIndex >= 0) {

      isButtonSelected[selectedIndex] = true;
    }

    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center( // Place text inside a Center environment to make it appear in the middle
              child: Text(
                widget.question.questionText,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // If we are not at the last question, add a "Prev" button
                widget.game.currentQuestionIndex > 0 ? IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    widget.game.showPrevQuestion(context);
                  },
                )
                    : Container(),
                Container(width: 50),
                // If we are not at the last question, add a "Next" button
                widget.game.currentQuestionIndex < widget.game.questions.length-1
                    ? IconButton(
                  icon: const Icon(Icons.arrow_forward),
                  onPressed: () {
                    widget.game.showNextQuestion(context);
                  },
                )
                    : Container(),
              ],
            ),
            const SizedBox(height: 32),
            _buildAnswerButton(0),
            const SizedBox(height: 16),
            _buildAnswerButton(1),
            const SizedBox(height: 16),
            _buildAnswerButton(2),
            const SizedBox(height: 16),
            _buildAnswerButton(3),
          ],
        ),
      ),
    );
  }

  Widget _buildAnswerButton(int index) {
    final answer = widget.question.answers[index];
    return ElevatedButton(
      onPressed: () {
        setState(() {
          for (int i = 0; i < isButtonSelected.length; i++) {
            isButtonSelected[i] = false;
          }
          isButtonSelected[index] = !isButtonSelected[index];
          widget.onAnswerSelected(index);
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: isButtonSelected[index] ? Colors.indigo[400] : Colors.indigo[300],
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        answer,
        style: const TextStyle(
          fontSize: 20,
          color: Colors.black54,
        ),
      ),
    );
  }
}

