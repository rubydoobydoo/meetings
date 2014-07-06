require "rubygems"
require "sequel"

class ProductStore

  def self.all
    products_table.map do |product_data|
      Product.new(product_data[:name], product_data[:price])
    end
  end
  
  def self.find(id)
    product_data = products_table.where({id: id}).first
    Product.new(product_data[:name], product_data[:price])
  end

  def self.products_table
    db = Sequel.sqlite("store.sqlite")
    db[:products]
  end

end

