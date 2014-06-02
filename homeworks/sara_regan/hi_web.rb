require 'sinatra'
require './product'

def products
  @@products ||= []
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
  product = Product.new(params[:name], params[:price].to_f)
  products << product
  id = products.length - 1
  redirect "/products/#{id}"
end

get '/products' do
  html = "<ul>"
  products.each_with_index do |product, index|
    html += "<li><a href='/products/#{index}'>#{product.name}</a> $#{product.price}</li>"
  end
  html += "</ul>"
  html
end

get '/products/:id' do
  product = products[params[:id].to_i]
  "<h1>this product is a #{product.name} and it costs $#{product.price}</h1>"
end
