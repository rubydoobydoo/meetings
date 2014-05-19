class ShoppingCart
	def initialize
		@products = []
	end
	def add_product(product)
		@products << product
	end
	def cart_count
		@shopping_cart.count 
	end
	def total
		sum = 0
		@products.each {|total| sum += total.price}
		sum
	end
	def list_products
		@products.each {|product| puts "Product: #{product.name}, costs: #{product.price} Euro"}
		"yeah"
	end

	def products
		@products
	end
	
	def most_expensive
		most_expensive = self.products.first
		self.products.each do |product|
			if product.price > most_expensive.price
				most_expensive = product
			end
		end
		puts "Product #{most_expensive.name} #{most_expensive.price} is most expensive!"
		#return most_expensive
	end
	def remove (product_name)
		@products.each do |product|
			if product.name == product_name
				@product_remove = product 
			end
		end
		@products = @products - [@product_remove]
	end
end

class Product
	def initialize(name, price, discount = 0)
		@name = name
		@price = price
		@discount = discount
	end
	def name
		@name
	end
	def price
		@price * (1 - @discount)
	end
end


mouse = Product.new("Mouse", 59.99, 0.10)
mouse.price
mouse.name
keyboard = Product.new("Keyboard", 69.99)
mouse_pad = Product.new("Mouse Pad", 9.99)
shopping_cart = ShoppingCart.new
shopping_cart.add_product(mouse)
shopping_cart.add_product(mouse_pad)
shopping_cart.add_product(keyboard)
shopping_cart.total
shopping_cart.list_products
shopping_cart.most_expensive
shopping_cart.remove("Mouse")
shopping_cart.list_products