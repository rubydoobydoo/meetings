#create_db
require "sequel"

begin
  DB = Sequel.sqlite('sinatra_shop.db')
  DB.create_table :products do
    primary_key :id
    String :name
    Float :price
    String :buy_link
  end
rescue

end

begin
  DB = Sequel.sqlite('sinatra_shop.db')
  DB.create_table :carts do
    primary_key :id
    String :username
    Float :session_id
    String :content
  end
rescue

end

# create a dataset from the items table
# products = DB[:products]

# # populate the table
# items.insert(:name => 'abc', :price => rand * 100)
# items.insert(:name => 'def', :price => rand * 100)
# items.insert(:name => 'ghi', :price => rand * 100)

# # print out the number of records
# puts "Item count: #{items.count}"

# # print out the average price
# puts "The average price is: #{items.avg(:price)}"
