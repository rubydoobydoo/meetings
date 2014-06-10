require "rubygems"
require "sequel"

# connect to an in-memory database
DB = Sequel.sqlite "store.sqlite"

# create an items table
DB.create_table :products do
  primary_key :id
  String :name
  Float :price
end


products = DB[:products]

# populate the table
products.insert(:name => 'Mouse', :price => rand * 100)
products.insert(:name => 'Keyboard', :price => rand * 100)
products.insert(:name => 'Mouse Pad', :price => rand * 100)

# print out the number of records
puts "Products count: #{products.count}"
