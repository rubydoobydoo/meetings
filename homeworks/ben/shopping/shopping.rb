class Product
  #belongs_to :cart
  attr_accessor :name, :price
  def initialize(name, price, discount = 0)
      @name = name
      @price = price *(1 - discount)
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
    content.each do |product|
      puts "#{product.name}: #{product.price} €"
    end
    puts "Sum:  #{self.total} €"
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

bike = Product.new("bike", 200, 0.1)
tire = Product.new("tire", 45)

val = Cart.new("val")
val.add_product(bike, 1)
val.add_product(tire, 1)

val.count
val.show_bill
puts val.most_expensive.name
val.remove_product("bike")
val.show_bill

