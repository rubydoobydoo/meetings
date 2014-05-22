require "rubygems"
require "gosu"

class Worm
	def initialize window
		@window = window
		@width = 170
		@height = 80
		#@idle = Gosu::Image::load_tiles(@window, 
		#"volt_runner.png", @width, @height, true)
		@move = Gosu::Image::load_tiles(@window, 
		"graphic/worm_sprite_170_80.png", @width, @height, true)
		# center image
		@x = @window.width/2 - @width/2
		@y = @window.height/2 + 200 - @height/2
		@direction = :right
		@frame = 0
		@moving = false
	end

	def update
		@frame += 1
		@moving = false
		if @window.button_down? Gosu:: KbLeft
			@direction = :left
			@moving = true
			@x += -5 
		elsif @window.button_down? Gosu:: KbRight
			@direction = :right
			@moving = true
			@x +=  5 
		end
	end

	def draw
		# @move and @idle should be the same size,
		# so we can use the same calc.
		#f = @frame % @idle.size
		f = @frame % @move.size
		image = @moving ? @move[f] : @move[0]
		#image = @move[f]
		if @direction == :right
			image.draw @x, @y, 1
		else
			image.draw @x + @width, @y, 1, -1, 1
		end
	end

	def worm_x
		@x
	end

	def worm_y
		@y
	end
end

class Apple
	def initialize window
		@window = window
		@apple = Gosu::Image::new(@window, "graphic/apple_100_100.png")
		@eat_apple = Gosu::Sample.new(@window, 
			"sounds/Apple_Bite-Simon_Craggs-1683647397.wav")
		# image at upper left corner
		rng = Random.new(123)
		respawn_apple
		@num_eaten_apples= 0
	end

	def respawn_apple
		@x = (rand()*(@window.width - @apple.width)).to_i
		@y =  - @apple.height/2
	end

	def update
		if @y < @window.height-100-(@apple.height/2) 
			@y = @y +2 
		elsif eaten
			@eat_apple.play
			respawn_apple
			@num_eaten_apples += 1
			puts "I ate it!"
		else
			respawn_apple
		end
	end

	def draw
		@apple.draw @x, @y, 1
	end

	def eaten
		x = @window.whosmyworm.worm_x
		y = @window.whosmyworm.worm_y

	#	puts "worms #{x}, #{y}, and apples #{@x} #{@y} "

		return ((@x - x).abs <(@apple.width/2) && (@y - y).abs < (@apple.height/2))
	end

	def num_eaten
		@num_eaten_apples
	end
end


class WormGame < Gosu::Window

	def initialize width = 800, height = 600, fullscreen = false
		super
		self.caption = "Worm Demo"
		@worm = Worm.new self
		@apple = Apple.new self
		@background_image = Gosu::Image.new(self, 
			"graphic/fields_800_600.png", true)
		# sounds
		#@song = Gosu::Song.new(self, 
		#	"sounds/lubenica.wav")
		#@song.play
		@eat_apple = Gosu::Sample.new(self, 
			"sounds/Apple_Bite-Simon_Craggs-1683647397.wav")
		@font = Gosu::Font.new(self, Gosu::default_font_name, 20)
	end

	def button_down id
		close if id == Gosu::KbEscape
		@eat_apple.play if id == Gosu::KbN
	end

	def update
		@worm.update
		@apple.update
	end

	def draw
		@worm.draw
		@apple.draw
		@background_image.draw(0,0,0)
		@font.draw("#{@apple.num_eaten}",self.width - 50, 20, 1, 2.5, 2.5, 0xfffff073)
	end

	def whosmyworm
		@worm
	end
end

WormGame.new.show