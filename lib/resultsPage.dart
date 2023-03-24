import 'package:flutter/material.dart';
import 'question.dart';
import 'questionPanel.dart';

class ResultsPage extends StatefulWidget {
  final List<Question> questions;
  final int score;

  const ResultsPage({Key? key, required this.questions, required this.score}) : super(key: key);

  @override
  _ResultsPageState createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  late PageController _pageController;
  late List<QuestionPanel> _questionPanels;

  @override
  void initState() {
    super.initState();

    _pageController = PageController();
    _questionPanels = List.generate(
      widget.questions.length,
          (index) => QuestionPanel(
        question: widget.questions[index],
        selectedAnswer: widget.questions[index].selectedAnswer,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Results'),
      ),
      body: Column(
        children: [
          Text('Your score is: ${widget.score}/${widget.questions.length}'),
          Expanded(
            child: PageView(
              controller: _pageController,
              children: _questionPanels,
            ),
          ),
        ],
      ),
    );
  }
}
