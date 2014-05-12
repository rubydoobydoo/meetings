class WinnerFinder

	@@hand_category = "Undefined"
	hands_categories = {"Royal Flush" => 10, "Straight Flush" => 9, 
						"Four of a kind" => 8, "Full House" => 7,
						"Flush" => 6, "Straight" => 5, "Three of a kind" => 4,
					 	"two pairs" => 3, "pair" => 2, "high card" => 1}

	def initialize(hands)
		@hands = hands
	end

	def num_suits(hand)
	    # initialize the array containing [#c,#d,#h,#s] that is returned 
	    # by the method
	    suits = Array.new(4, 0)
	    # adding entries to suits 
	    hand.each{|card| 
	      case card[1]
	      when 'c'
	        suits[0]+=1
	      when 'd'
	        suits[1]+=1
	      when 'h'
	        suits[2]+=1      
	      when 's'
	        suits[3]+=1
	      end
	      } 
	    # methods return: the number of suits in each hand
	    return suits 
  	end

  	def num_faces(hand)
        # initialize the array containing [#A,#K,#Q,#J, #T, #9, ... , #2] 
        # that is returned by the method
	    faces = Array.new(13, 0)
	    # adding entries to faces
	    hand.each{|card| 
	      case card[0]
	      when 'A'
	        faces[0]+=1
	      when 'K'
	        faces[1]+=1
	      when 'Q'
	        faces[2]+=1      
	      when 'J'
	        faces[3]+=1
	      when 'T'
	        faces[4]+=1      
	      else
	        for i in 2..9
	          faces[13-i+1] += 1 if card[0]==i
	        end
	      end
	    } 
	    # methods return: the number of faces in each hand
	    return faces
  	end

  	# determine the hand category
  	def find_hand_category(hand)
  		if hand.size == 7
  			# really not good!! have to put royal flush, straight flush
  			# and straigh together! 
  			if num_suits(hand).max >= 5 && num_faces(hand)[0..4] == Array.new(5,1) 
  				@@hand_category = "Royal Flush"
  			elsif num_faces(hand).max >= 4
  				@@hand_category = "Four of a kind"
  			elsif num_faces(hand).max == 3
  				@@hand_category = "Three of a kind"
  			elsif num_faces(hand).max == 2
  				@@hand_category = "pair"
  			elsif num_faces(hand).sort.last>=3 && num_faces(hand).sort[12]>=2
  				@@hand_category = "Full House"
  			elsif num_faces(hand).sort.last == 2 && num_faces(hand).sort[12]==2
  				@@hand_category = "two pairs"
  			end  
  		end
  		return @@hand_category
  	end

  	# determine the winner
    def whos_the_winner(hands)
	    hands.each { |h|
	      if h.size == 7

	      end
	    }
  	end
end