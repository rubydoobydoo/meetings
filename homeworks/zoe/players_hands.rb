class PlayersHands

 # create and initialize class variables
  FACES = "AKQJT98765432"
  SUITS = "cdhs"


 # initialization of players hands
  def initialize(num_players)
	@num_players = num_players
  end

 # getter for the number of players
  def get_players_num
  	@num_players
  end

 # build a deck
  def make_deck
  	@deck = []
	FACES.each_byte do |f|
		SUITS.each_byte do |s|
			@deck.push(f.chr + s.chr) #(zoe)contains Ac, Ad, Ah, As, Kc, Kd, Kh, Ks....
		end
	end
  end

 # shuffle deck
  def shuffle_deck
  	3.times do                            
    	shuf = []
    	@deck.each do |c|
    		loc = rand(shuf.size + 1)
    		shuf.insert(loc, c)
    	end
    	@deck = shuf.reverse
    end
  end

  def make_hands(players_num)
  	common = Array.new(5) { @deck.pop }		# deal common cards
  	# deal player's hole cards
    hole = Array.new(players_num) { Array.new(2) { @deck.pop } }	
    													
    hands = []                            # output hands
    all_fold = true
    while all_fold do
      hands = []
      hole.each do |h|
        num_common = [0, 3, 4, 5][rand(4)]
        if num_common == 5
          all_fold = false
        end
        if num_common > 0
          hand = h + common[0 ... num_common]
        else
          hand = h
        end
        hands.push(hand)
      end 
    end
    hands
  end
end