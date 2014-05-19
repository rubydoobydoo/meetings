class Product
	# initializes instances of the class
	def initialize(name, brand, price, discount)
		@name = name
		@brand = brand
		@price = price
		@discount = discount
	end

	def price
		@price -= @discount*@price if @discount>0
		@price
	end

	def name		
		@name	
	end

	def brand
		@brand
	end

	def discount
		@discount
	end

	def product_specifics
		puts "It is a #{@brand} #{@name} 
		that costs #{@price}!"
	end
end