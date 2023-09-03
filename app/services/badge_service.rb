 
class BadgeGranterService

  def initialize(test_passage)
    @test_passage = test_passage
    @badges = []
  end

  def call
    check_attainments!
    @test_passage.user.badges.push(@badges)
  end

  def achievements
    check_attainments!
    @badges
  end

  private

  def check_attainments!
    @badges = Badge.all.select do |badge|
      send("rule_type_#{badge.rule_type.downcase}?", badge.rule_option)
    end
  end
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
