require "rubygems"
require "sequel"

class ProductStore

  def self.all
    products_table.map do |product_data|
      Product.new(product_data)
    end
  end

  def self.products_table
    db = Sequel.sqlite("store.sqlite")
    db[:products]
  end

  def self.find(id)
    product_data = products_table.where(:id => id).first
    Product.new(product_data)
  end

  def self.add(product)
    products_table.insert(:name => product.name, :price => product.price)
  end

  def self.delete(id)
    products_table.where(:id => id).delete
  end

end
