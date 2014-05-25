require 'sinatra'
require_relative './shopping_cart.rb'

get '/' do
	"<h1>Welcome to the Rubydoobydoo Shop!</h1>
	<p><a href='/products'>Our Product List</a>"
end

get '/products' do
	heading = "<h1>Our Product List</h1><p><a href='/'>Back</a><p>"
	my_products = ""
	Product.list.each do |product|
		my_products << product.name
		my_products << product.price.to_s
	end 
	return heading + my_products.to_s
end






get '/hi' do
  "Hi Web!"  
end

get '/posts/:id' do
  "this is post number #{params[:id]}"
end