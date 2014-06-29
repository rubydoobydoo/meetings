require 'sinatra'
require_relative './gemfile.rb'
require_relative './db/create_db.rb'
require_relative './db/config.rb'
require_relative './models/product.rb'
require_relative './models/cart.rb'
#require_relative "./models/crawl.rb"
require_relative "./models/email_provider.rb"
require_relative "./models/mail_account.rb"
require_relative './helpers/product_initializers.rb'
require_relative './api/api.rb'



# def render_correct_template(string, params)
#   format = "normal" if params["format"].nil?
#   case format
#   when "plain" then return string
#   when "normal" then return erb string
#   else return "Error occured: Invalid format!"
#   end
# end

configure do
  enable :sessions
end

helpers do
  def username
    session[:identity] ? session[:identity] : 'Hello stranger'
  end
end

get '/sessiontest' do
  session["value"] ||= "Hello world!"
  "The cookie you've created contains the value: #{session["value"]}. The entire cookie is #{session}"
end

get '/stream' do
  stream do |out|
    out << "It's gonna be legen -\n"
    sleep 0.5
    out << " (wait for it) \n"
    sleep 1
    out << "- dary!\n"
  end
end

before '/secure/*' do
  if !session[:identity] then
    session[:previous_url] = request.path
    @error = 'Sorry guacamole, you need to be logged in to visit ' + request.path
    halt erb(:login_form)
  end
end

get '/hi/:name' do
  erb("<h1>Hello #{params[:name]}</h1>", params)
end

get '/' do
  erb :index
end

# get '/posts/:id' do
#   params[:id]
# end

get '/products' do
  products = Product.show_products
  erb "#{products}"
end

post '/products/buy' do
  cart = Cart.carts.first
  cart.params[:name]
end

get '/product_search' do
   erb :product_search
end

post '/product_search/search' do
   products = Product.find_product_by_name(params[:product_name])
   if products != ""
      erb "#{products}"
   else
      erb "I couldn't find #{params[product_name]}"
   end
end

get '/products/delete/:id' do

   erb Product.delete(params[:id])

end


get '/cart' do
  cart = Cart.carts.first
  erb cart.show_bill
end

get '/login/form' do
  erb :login_form
end

post '/login/attempt' do
  session[:identity] = params['username']
  where_user_came_from = session[:previous_url] || '/'
  redirect to where_user_came_from
end

get '/contact/form' do
  erb :contact_form
end

post '/contact/send_data' do

  erb "Thank you, <b>#{params['prename']} #{params['last_name']}</b>. Your email <b>#{params['email']}</b> has been recorded."
end

get '/admin/new_product' do
  erb :new_product_form
end

post '/admin/new_product_create' do
  item = Product.new(params['product_name'], params['price'].to_f, params['discount'].to_f)
  erb "Thanks for creating #{item.name}."
end

get '/logout' do
  session.delete(:identity)
  erb "<div class='alert alert-message'>Logged out</div>"
end


get '/secure/place' do
  erb "This is a secret place that only <%=session[:identity]%> has access to!"
end
