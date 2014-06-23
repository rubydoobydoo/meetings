### Instructions

#### Step 1. Creating the Database

First we have to create the DB. You only have to do that once. 
Using the following command: 
 
```ruby
cd /path_to_repo/meetings/homeworks/home04
ruby db/create_db.rb 
```

#### Step 2. Listing all the Products

You can run the sample web app by using the following command:

```ruby
ruby app/app.rb
```

The following method from app.rb, uses the ProductStore to fetch all the
products from the local sqlite db.

```ruby
# app/app.rb

get '/products' do
  products = ProductStore.all

  response = ""
  products.each do |product|
    response += "<p>#{product.name}  #{product.price}</p>"
  end

  response
end
```

The ProductStore is an class which knows how to:
 1. access the database
 2. create Product objects from db records.
 3. list all products
 4. TBD find products by ID 


### Homework excercise

checkout app/app.rb.
Implement '/products/:id' such that it returns products by id.

```ruby
get '/products/:id' do
  #TODO: HOMEWORK
  #      Implement ProductStore.find(params[:id])
  "Hoemwork show product with ID #{params[:id]}"
end
```


