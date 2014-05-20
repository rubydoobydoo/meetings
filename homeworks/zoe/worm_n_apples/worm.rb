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
end

class Apple
	def initialize window
		@window = window
		@apple = Gosu::Image::new(@window, "graphic/apple_100_100.png")
		# image at upper left corner
		@x = @window.width/2 - @apple.width/2
		@y = @window.height/3  - @apple.height/2
	end

	def update
	end

	def draw
		@apple.draw @x, @y, 1
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
	end
end


WormGame.new.show