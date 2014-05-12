require_relative "players_hands"
require_relative "winner_finder"

player_num = 5
turns_hands = PlayersHands.new(player_num)

# create and shuffle deck
deck = turns_hands.make_deck
deck = turns_hands.shuffle_deck(deck)

# begin game players hands
hands = turns_hands.make_hands(deck, player_num)

counter = 1
hands.each { |h| puts "player #{counter}: #{h}" 
                 counter +=1}
puts "-----"
finder = WinnerFinder.new(hands)

hands.each{|h| puts finder.find_hand_category(h)}


