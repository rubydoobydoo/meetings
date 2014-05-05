# High Low game
number = rand(10)
#puts number
puts "Please input your guess"
guess = gets.to_i

until number == guess 
	if number < guess
		puts "Too high, man!"
	else 
		puts "Too low, idiot!"
	end	
	puts "Try again!"
	guess = gets.to_i
end

puts "You are the coolest! Your guess #{guess} was right!"