class ShoppingCart

  def initialize
    products = []
  end
  
  def products
    @products
  end
  
  def add_product(product)
    products << product
  end
  
  def count_of_products
    products.count
  end
  
  def list_products
    products.each do |p|
      puts "#{p.name} costs #{p.price}"
    end
  end
  
  def cart_total
    sum = 0
    products.each do |p|
      sum += p.price
    end
    sum
  end 
  
  
end