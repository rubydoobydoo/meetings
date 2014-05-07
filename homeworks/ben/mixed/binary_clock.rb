# Here is the crazy binary clock
class BinaryTime
  attr_accessor :time, :hours, :minutes, :seconds
  def initialize(time=Time.now)
    @hours = convert_to_binary time.hour
    @minutes = convert_to_binary time.min
    @seconds = convert_to_binary time.sec
  end

  def convert_to_binary(number)
    number.to_s(2)
  end

  # def to_s
  #   "#{hours}:#{minutes}:#{seconds}"
  # end
end

class Renderer
  # def initialize(kind=BinaryTime)
  #   @kind = kind
  # end
  def render
    while true
      system('clear')
      puts "Geek Clock - binary time!"
      time = BinaryTime.new
      seconds = time.seconds
      puts "it is now #{seconds}!"

      sleep 1
    end
  end
end

#Renderer.new.render
p= BinaryTime.new
puts p.inspect
