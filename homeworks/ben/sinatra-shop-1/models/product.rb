class Product
  #@@product_list = []
  @@db_table = DB[:products]
  #belongs_to :cart
  attr_accessor :name, :price, :id

  def initialize(name, price, discount = 0)
      @id = Product.number_of_products
      @name = name
      @price = price *(1 - discount)
      @buy_link = 'products/buy/#{self.name}'
      #@@product_list.push self
      push_to_db(self)
      puts "#{self.name} initialized"
  end

  def push_to_db(product_object)
    # populate the table
    insertion = @@db_table.insert(:name => product_object.name, :price => product_object.price)
    puts "#{self.name} saved in DB."
  end

  def self.show_products
    products = "<h2> Products </h2>"
    new_line = "<br>"
    @@db_table.each do |product|
      products += "#{product[:name]} #{product[:price]} #{new_line}"
      #products += "#{product}"
    end
    products.to_s
  end

  def self.number_of_products
    @@db_table.count
  end

  def self.find_product_by_name(product_name)
    @@db_table.where(:name=>product_name).first
  end
end