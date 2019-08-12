const String getTests = r'''
  query getTests($filterType: FilterType, $subjectId: String, $categoryId: String, $page: Int, $pageSize: Int, $levelId: String) {
  getTests(filterType: $filterType, subjectId: $subjectId, categoryId: $categoryId, page: $page, pageSize: $pageSize, levelId: $levelId) {
    totalPages
    totalElements
    size
    number
    numberOfElements
    content {
      id
      testName
      coin
      comment
      createTime
      description
      duration
      enable
      rateCount
      testDoneCount
      testBuyCount
      levelId
      cateId
      subject {
        id
        name
        image
      }
      isBought
      isTested
      teacher {
        id
        fullName
        avatar
      }
    }
  }
}

''';
