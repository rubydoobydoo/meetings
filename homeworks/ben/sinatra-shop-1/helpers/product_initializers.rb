bike = Product.new("Best bike in the world", 200, 0.1)
tire = Product.new("Nice Tire", 45.0)
beer = Product.new("Beer", 1.99)

val = Cart.new("val")
val.add_product(bike, 1)
val.add_product(tire, 1)
