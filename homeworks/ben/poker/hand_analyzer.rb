#HandAnalyzer Class
# http://www.thepokerforum.com/pokerhands.htm

class HandAnalyzer
  def initialize(hand)
    @hand = hand
    @faces = self.isolate_faces
    @suits = self.isolate_suits
    @highest_achievement
    @score = self.calculate_score
    puts self.inspect
  end

  def isolate_faces
    faces = []
    @hand.each do |card|
      faces.push card[0]
    end
    faces
  end

  def isolate_suits
    suits = []
    @hand.each do |card|
      suits.push card[1]
    end
    suits
  end


  def rank_face(face)
    ranks = {
      "A" => 13,
      "K" => 12,
      "Q" => 11,
      "J" => 10,
      "T" => 9,
      "9" => 8,
      "8" => 7,
      "7" => 6,
      "6" => 5,
      "5" => 4,
      "4" => 3,
      "3" => 2,
      "2" => 1,
    }
    ranks[face]
  end

  def rank_suits(suit)
    ranks = {
      "c" => 4,
      "d" => 3,
      "h" => 2,
      "s" => 1,
    }
    ranks[suit]
  end

  def how_many_same_faces
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

  def high_card
    @hand
  end


end