# PokerGame Class

class PokerGame
  attr_accessor :deck
  def initialize(number_of_players)
    @deck = create_deck
    @players = create_players(number_of_players)
    @hands = create_hands(@players)
  end

  def create_deck
    faces = "AKQJT98765432".split("")
    suits = "cdhs".split("")   #clubs = Caro, diamonds = caro, heart = Herz, spades = Pick,
    deck = []
    faces.each do |face|
      suits.each do |suit|
        card = face + suit
        deck.push card
      end
    end
    deck.shuffle!
    puts "Created Deck: #{deck.count}"
    deck
  end

  def create_players(number_of_players)
    players = []
    number_of_players.times do |player|
      players.push player+1
    end
    puts "Created Players: #{players}"
    players
  end

  def create_hands(players)
    hands = {}
    players.each do |player|
      hands[player] = []
    end
    puts "Created empty hand for each player: #{hands}"
    hands
  end

  def burn
    @deck = @deck.drop(1)
  end

  def take_card
    card = @deck[0]
    @deck = @deck.drop(1)
    card
  end

  def deal_one_round
    self.burn
    @players.each do |player|
      card = self.take_card
      @hands[player].push card
      #puts "Hands updated: #{@hands}"
      #puts "Remaining deck: #{@deck}"
    end
    puts "Dealt one round. These are the hands: #{@hands}"
  end

  def give_cards_to_players
    2.times do
      self.deal_one_round
    end
  end

  def put_card_in_the_middle
    self.burn
    card = self.take_card
    @players.each do |player|
      @hands[player].push card
    end
    puts "Added #{card} to all active players."
    puts @hands
  end

  def run_standard_game
    self.give_cards_to_players
    3.times do |n|
      self.put_card_in_the_middle
    end
  end
end


