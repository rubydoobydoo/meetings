## Meeting 04


### CRUD

Basic database actions

* create
* read
* update
* delete

### REST

Representational state transfer 

A mapping of HTTP verbs to database actions

* GET =>  read
* PUT => create
* POST => update
* DELETE => delete

### Exercise

Build a formular to create a new products.
Basically the will have a field for price and name
and a submit button.

```html
<form>
  <input type="text" name="name"></input>
  <input type="text" name="price"></input>
  <input type="submit">Add</input>
</form>
```

Storing the data
----------------

You could use a class variable to store products in memory

```ruby
post '/products' do
  @@products ||= []
  
  # create a new product and add it
  # to the array
  
end
```
