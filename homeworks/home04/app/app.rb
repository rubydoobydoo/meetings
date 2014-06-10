require 'sinatra'
require_relative 'product'
require_relative 'product_store'

get '/products' do
  products = ProductStore.all

  response = ""
  products.each do |product|
    response += "<p>#{product.name}  #{product.price}</p>"
  end

  response
end

get '/products/:id' do
  #TODO: HOMEWORK
  #      Implement ProductStore.find(params[:id])
  "Hoemwork show product with ID #{params[:id]}"
end