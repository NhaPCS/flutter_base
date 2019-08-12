const String submitTest = r'''
mutation SubmitTest($testId: String, $duration: Int, $results: [QuestionResult]) {
  submitTest(testId: $testId, duration: $duration, results: $results) {
    bestCount
    bestPoint
    arrayUserBest {
      id
      displayName
      avatarUrl
      school
      description
    }
    userEqualCount
    userWorseCount
    userBetterCount
    correctCount
    wrongCount
    totalPoint
  }
}


''';

