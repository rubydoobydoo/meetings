class Product
  @@product_list = []
  #belongs_to :cart
  attr_accessor :name, :price, :id
  def initialize(name, price, discount = 0)
      @id = Product.number_of_products
      @name = name
      @price = price *(1 - discount)
      @buy_link = 'products/buy/#{self.name}'
      @@product_list.push self
      puts "#{self.name} initialized"
  end

  def self.show_products
    products = "<h2> Products </h2>"
    new_line = "<br>"
    @@product_list.each do |product|
      products += "#{product.name}: #{product.price} #{new_line}"
    end
    products
  end

  def number_of_products
    @@product_list.count
  end
end