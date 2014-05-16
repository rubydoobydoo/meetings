####Shopping Cart
due to next Monday, 19.05.2014  

Last project group meeting we built the following program.

```ruby
# file product.rb

class Product

  def initialize(name, price)
    @name = name
    @price = price
  end

  def name
    @name
  end

  def price
    @price
  end

end
```

```ruby
# file shopping_cart.rb
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
end
```

in irb if you load this two files, you should be able to do the following
```ruby
$  irb
irb(main)> load 'product.rb'
irb(main)> load 'shopping_cart.rb'

irb(main)> mouse = Product.new("Mouse", 59.99)
irb(main)> mouse.price
=> 59.99
irb(main)> mouse.name
=> "Mouse"
irb(main)> keyboard = Product.new("Keyboard", 69.99)
...
irb(main)> mouse_pad = Product.new("Mouse Pad", 9.99)
...

irb(main):006:0> shopping_cart = ShoppingCart.new
...
irb(main):007:0> shopping_cart.add_product(mouse)
...
irb(main):008:0> shopping_cart.add_product(mouse_pad)
...
irb(main):009:0> shopping_cart.add_product(keyboard)
...
irb(main):010:0> shopping_cart.total
=> 139.97
irb(main):013:0> shopping_cart.list_products
Your cart has the following products:
Mouse  59.99€
Mouse Pad  9.99€
Keyboard  69.99€
Total: 139.97€
...
irb(main):014:0>
```


### Homework

1. Extend the product such that it allows you to add a discount percentage. 
The method price should return the price with the discount applied, for example:
```ruby
$  irb
irb(main)> load 'product.rb'
irb(main)> mouse = Product.new("Mouse", 59.99, 0.1) # %10 discount
irb(main)> mouse.price
=> 53.99
```


2. Extend the shopping cart such that it can display you the most expensive product, for example:

```ruby
$  irb
irb(main)> load 'product.rb'
irb(main)> load 'shopping_cart.rb'

irb(main)> mouse = Product.new("Mouse", 59.99)
irb(main)> mouse.price
=> 59.99
irb(main)> mouse.name
=> "Mouse"
irb(main)> keyboard = Product.new("Keyboard", 69.99)
...
irb(main)> mouse_pad = Product.new("Mouse Pad", 9.99)
...

irb(main):006:0> shopping_cart = ShoppingCart.new
...
irb(main):007:0> shopping_cart.add_product(mouse)
...
irb(main):008:0> shopping_cart.add_product(mouse_pad)
...
irb(main):009:0> shopping_cart.add_product(keyboard)
...
irb(main):009:0> shopping_cart.most_expensive
Keyboard 69.99€, is the most expensive product.
```


3. Extend the shopping cart such that it can remove a product by name, for example:
(If there are more products with the same name remove them all.)

```ruby
$  irb
irb(main)> load 'product.rb'
irb(main)> load 'shopping_cart.rb'

irb(main)> mouse = Product.new("Mouse", 59.99)
irb(main)> mouse.price
=> 59.99
irb(main)> mouse.name
=> "Mouse"
irb(main)> keyboard = Product.new("Keyboard", 69.99)
...
irb(main)> mouse_pad = Product.new("Mouse Pad", 9.99)
...

irb(main):006:0> shopping_cart = ShoppingCart.new
...
irb(main):007:0> shopping_cart.add_product(mouse)
...
irb(main):008:0> shopping_cart.add_product(mouse_pad)
...
irb(main):009:0> shopping_cart.add_product(keyboard)
...
irb(main):013:0> shopping_cart.list_products
Your cart has the following products:
Mouse  59.99€
Mouse Pad  9.99€
Keyboard  69.99€
Total: 139.97€
...
irb(main):014:0> shopping_cart.remove("Mouse")
...
irb(main):013:0> shopping_cart.list_products
Your cart has the following products:
Mouse Pad  9.99€
Keyboard  69.99€
Total: 79.97€

```




