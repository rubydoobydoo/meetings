module Rdd
  class Product

    def initialize(name, price, discount=0)
      @name = name
      @price = price
      @discount = discount
    end

    def name
      @name
    end

    def price
      @price * ( 1 - @discount )
    end
  end
end
