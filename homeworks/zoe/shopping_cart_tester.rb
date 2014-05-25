require_relative "product"
require_relative "shopping_cart"

mouse = Product.new("Mouse", "Razor", 59.99, 0)
keyboard = Product.new("keyboard", "Razor", 69.99, 0)
mouse_pad = Product.new("Mouse Pad", "Razor", 9.99, 0)

shopping_cart = ShoppingCart.new("Pc and Electronics")

shopping_cart.add_product(mouse)
shopping_cart.add_product(keyboard)
shopping_cart.add_product(mouse_pad)

puts shopping_cart.total_price

puts mouse.price

shopping_cart.list_products

laptop = Product.new("Laptop", "HP", 499.99, 0.10)
puts laptop.price

shopping_cart.most_expensive

shopping_cart.remove("Mouse")

shopping_cart.list_products