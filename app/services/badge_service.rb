  def rule_type_first_try?(_value)
    test_passages = TestPassage.where(user: @test_passage.user, test: @test_passage.test)
    test_passages.count == 1
  end

  def rule_type_category?(category_id)
   
    return false if category_id != @test_passage.test.category_id

    tests = Test.where(category: category_id).pluck(:id)
    completed = @test_passage.user.test_passages.passed
                  .where(test: tests)
                  .pluck(:test_id).uniq
    tests.count == completed.count
  end

  def rule_type_level?(level)
  
    return false if level != @test_passage.test.level

    tests = Test.where(level: level).pluck(:id)
    completed = @test_passage.user.test_passages.passed
                  .where(test: tests)
                  .pluck(:test_id).uniq
    tests.count == completed.count
  end

end
