require_relative "winner_finder"

hand1 = ["As", "Ac", "Ah", "As", "2c", "9c", "3c"]
hand2 = ["Qs", "Qc", "Qh", "4s", "4c", "9c", "3c"]
hand3 = ["Ah", "Kh", "Jh", "Th", "Qh", "Ac", "Tc"]
hands = [hand1, hand2, hand3]

finder = WinnerFinder.new(hands)

hands.each{|h| puts h.join(' ')}

hands.each{|h| puts finder.find_hand_category(h)}

