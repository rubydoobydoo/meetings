class Product

  attr_reader :id, :name, :price

  def initialize(params)
    @name = params[:name]
    @price = params[:price]
    @id = params[:id]
  end

  def name
    @name
  end

  def price
    @price.round(2)
  end

end
