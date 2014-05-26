class Cart
  attr_accessor :content
  @@carts = []

  def initialize(owner)
    puts "New Cart created for #{owner}"
    @owner = owner
    @content = []
    @@carts.push self
  end

  def self.carts
    @@carts
  end

  def add_product(product, quantity)
    quantity.times do |n|
      @content.push product
    end
    puts "#{quantity} #{product.name} added"
  end

  def remove_product(product_name)
    n = 0
    self.content.each do |product|
      if product.name == product_name
        @content -=  [product]
        puts "#{product.name} removed."
      end
    end
  end

  def count
    puts "Val's cart contains #{@content.count} different articles."
    @content.count
  end

  def total
    sum = 0
    @content.each do |p|
      sum += p.price
    end
    #puts "The sum is #{sum}"
    sum
  end

  def show_bill
    bill = "<h2> Your Cart </h2>"
    @content.each do |product|
      bill +=  "#{product.name}: #{product.price} € <br>"
    end
    bill += "<b> Total is #{self.total} € </b>"
  end

  def most_expensive
    return "Cart is empty" if self.content.count == 0
    most_expensive = self.content.first
    self.content.each do |product|
      if product.price > most_expensive.price
        most_expensive = product
      end
    end
    puts "Most expensive product is #{most_expensive.name} which costs #{most_expensive.price}"
    most_expensive
  end

end


