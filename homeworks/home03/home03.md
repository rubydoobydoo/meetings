## Sinatra

Due tu 26.05.2014


### Install Sinatra

    gem install sinatra

### Hello Web App

Create a file named 'hello_web.rb'

```ruby
require 'sinatra'

get '/' do
  "Hello Web!"  
end

get '/hi' do
  "Hi Web!"  
end

get '/posts/:id' do
  "this is post number #{params[:id]}"
end
```

Start the app in your console with:

    ruby hello_web.rb

Then go to your browser visit the server url (localhost:4567)

### How to load ruby files

```ruby
require_relative "my_file"
```

or

```ruby
load "my_file.rb"
```

## Exercise

The homework for this week will be, to move your shopping app from last week to the online world. So basically we are going to rebuild Amazon!

Your shopping web site will have two URLs

To list all available products:

    /products

To view a specific product:

    /products/:name

where `name` is the product name.

First, you need to build a method, that creates a list
of products, that will be available in your shop.

```ruby
def products
  products = []
  products << Product.new("Beer", 0.99)
  products << Product.new("Banana", 1.50)
  ...
  products # returns the products from the method
end
```

### Optional

If you can't wait, to make your shopping website even more awesome, you can try
to send real html code, instead of plain text.
Here are some ideas:

**Add a headline**

    <h1>Welcome to Rubydoobydoo Shop!</h1>

**Links**

Create a link for each product in the product list:

    <a href="/products/Banana">Banana</a>
