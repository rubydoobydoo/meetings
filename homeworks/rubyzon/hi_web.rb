require 'sinatra'
require './product'

def products
  products = []
  products << Product.new("Beer", 0.99)
  products << Product.new("Banana", 1.50)
  products << Product.new("foobaa", 100.00)
end

get '/' do
  '<h1>Welcome to Rubydoobydoo Shop!</h1>'
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