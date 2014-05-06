#HandAnalyzer Class
# http://www.thepokerforum.com/pokerhands.htm

class HandAnalyzer
  def initialize(hand)
    @hand = hand
    @score = self.calculate_score
  end

  def calculate_score
  end

  def has_royal_flush?
  end

  def has_straight_flush?
  end

  def has_four_of_a_kind?
  end

  def has_full_house?
  end

end