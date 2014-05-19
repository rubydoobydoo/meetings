class ShoppingCart

	def initialize(name)
		@shopping_cart = []
		@item_count = 0
		@name = name
	end

	# adding products to the shopping cart
	def add_product(product)
		@shopping_cart << product
		@item_count +=1		# add one to the item counter
	end

	def list_products
		puts "Your cart has the following products:"
		@shopping_cart.each{ |item| puts "#{item.name} \t #{item.price}."}
		puts "Total price: #{total_price} "
	end


	def item_count
		@item_count
	end

	def total_price
		sum = 0
		@shopping_cart.each { |item| sum += item.price }
		sum
	end

	def most_expensive
		name = "nthg"
		price = 0
		@shopping_cart.each{ 
			|item| name = item.name, price = item.price if item.price > price
		}
		puts "#{name} #{price} is the most expensive item."
	end

	def remove(name)
		dlt_item = nil
		@shopping_cart.each{ 
			|item| dlt_item = item if name = item.name
		}
		puts dlt_item.name
		@shopping_cart.delete(dlt_item)
	end
end