module Rdd
  class ShoppingCart
    def initialize
      @products = []
    end

    def add_product(product)
      @products.push(product)
    end

    def list_products
      puts "Your cart has the following products:"
      @products.each do |product|
        puts "#{product.name}  #{product.price}€"
      end
      # calls the method 'total'
      puts "Total: #{total}€"
    end

    def total
      sum = 0
      @products.each do |product|
        sum += product.price
      end
      sum
    end

    def most_expensive
      #@products.max { |p1, p2| p1.price <=> p2.price }
      @products.max_by { |p| p.price }
    end

    def remove_product(name)
      @products.delete_if { |product| product.name == name }
    end
  end
end
