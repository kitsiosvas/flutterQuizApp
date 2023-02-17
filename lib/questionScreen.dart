import 'package:flutter/material.dart';
import 'question.dart';
import 'game.dart';


class QuestionScreen extends StatefulWidget {
  final Question question;
  final Game game;

  const QuestionScreen({
  super.key,
  required this.question,
  required this.game,
  });

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  List<bool> isSelected = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    int selectedIndex = widget.question.selectedAnswerIndex;
    if (selectedIndex >= 0) {
      isSelected = [false, false, false, false];
      isSelected[selectedIndex] = true;
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: (){
            Navigator.popUntil(context, ModalRoute.withName(Navigator.defaultRouteName));
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Center(
              child: Text(
                widget.question.questionText,
                style: const TextStyle(fontSize: 25),
                textAlign: TextAlign.center,
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
              widget.game.currentQuestionIndex < widget.game.questionScreens.length-1
                  ? IconButton(
                icon: const Icon(Icons.arrow_forward),
                onPressed: () {
                  widget.game.showNextQuestion(context);
                },
              )
                  : Container(),
            ],
          ),
          Expanded(
            flex: 6,
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 4,
              children: [
                _buildAnswerButton(0),
                _buildAnswerButton(1),
                _buildAnswerButton(2),
                _buildAnswerButton(3),
              ],
            ),
          ),
          SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.game.questionScreens.length,
              itemBuilder: (context, index) {
                return MaterialButton(
                  onPressed: () {
                    widget.game.jumpToQuestion(index);
                  },
                  child: Text(
                    (index + 1).toString(),
                    style: TextStyle(fontSize: 20),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnswerButton(int index) {
    return Container(
      height: 20,
      decoration: BoxDecoration(
        color: isSelected[index] ? Colors.indigo[400] : Colors.indigo[300],
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.white12,
            offset: Offset(2, 2),
            blurRadius: 5,
          ),
        ],
      ),
      child: MaterialButton(
        onPressed: () {
          setState(() {
            for (int i = 0; i < isSelected.length; i++) {
              isSelected[i] = false;
            }
            isSelected[index] = !isSelected[index];
            widget.question.setSelectedAnswerIndex(index);
          });
        },
        child: Text(
          widget.question.answers[index],
          style: const TextStyle(fontSize: 20, color: Colors.black54),
        ),
      ),
    );
  }
}
