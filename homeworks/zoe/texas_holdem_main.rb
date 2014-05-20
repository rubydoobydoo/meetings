require_relative "players_hands"
require_relative "winner_finder"

player_num = 8
turns_hands = PlayersHands.new(player_num)

# create and shuffle deck
turns_hands.make_deck
turns_hands.shuffle_deck

# begin game players hands
hands = turns_hands.make_hands(player_num)
puts hands[1].class
counter = 1
hands.each { |h| puts "player #{counter}: #{h.join(' ')}" 
                 counter +=1}
puts "-----"
finder = WinnerFinder.new(hands)

hands.each{|h| puts finder.find_hand_category(h)}


