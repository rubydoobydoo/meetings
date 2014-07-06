require 'sinatra'
require_relative 'product'
require_relative 'product_store'


def products
  ProductStore.all
end

get '/' do
  '<h1>Welcome to Rubydoobydoo Shop!</h1>
  <form action="/products" method="post">
    <input type="text" name="name" />
    <input type="text" name="price" />
    <button type="submit">Add</button>
  </form>'
end

post '/products' do
  product = Product.new(:name => params[:name], :price => params[:price].to_f)
  ProductStore.add(product)
  redirect "/products"
end


get '/products' do
  html = "<ul>"
  products.each do |product|
    html += "<li><a href='/products/#{product.id}'>#{product.name}</a> $#{product.price}</li>"
  end
  html += "</ul>"
  html
end

get '/products/:id' do
  product = ProductStore.find(params[:id])
  """
  <p>#{product.name}  #{product.price}</p>
  <form action='/products/#{product.id}' method='post'>
  <input type='hidden' name='_method' value='delete'>
      <button type='submit'>Delete</button>
  </form>
  """
end

delete '/products/:id' do
  ProductStore.delete(params[:id])
  redirect "/products"
end
