#Texas Holdem Analyzer
#Masterfile

require_relative "poker_game"
require_relative "hand_analyzer"

game = PokerGame.new(3)
game.run_standard_game
puts "---------"
puts game.hands
game.hands.each do |player, hand|
  HandAnalyzer.new(hand)
end