class Question {
  final String questionText;
  final List<String> answers;
  final int correctAnswerIndex;
  int selectedAnswerIndex = -1; // late means the value will be initialized later

  Question(this.questionText, this.answers, this.correctAnswerIndex);

  String getCorrectAnswer() {
    return answers[correctAnswerIndex];
  }

  void setSelectedAnswerIndex(int selectedAnswerIndex) {
    this.selectedAnswerIndex = selectedAnswerIndex;
  }
}