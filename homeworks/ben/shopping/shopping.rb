class Product
  #belongs_to :cart
  attr_accessor :name, :price
  def initialize(name, price)
      @name = name
      @price = price
  end
end


class Cart
  #has_many :products
  attr_accessor :content
  def initialize(owner)
    puts "New Cart created for #{owner}"
    @owner = owner
    @content = []
  end

  def add_product(product, quantity)
    puts "#{quantity} #{product.name} added"
    quantity.times do |n|
      @content.push product
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
    puts "The sum is #{sum}"
    sum
  end

end

bike = Product.new("bike", 200)
tire = Product.new("tire", 45)

val = Cart.new("val")
val.add_product(bike, 1)
val.add_product(tire, 1)

val.count
val.total

