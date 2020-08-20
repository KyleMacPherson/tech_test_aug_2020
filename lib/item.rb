class Item
  attr_reader :product_code, :name , :price

  def initialize(product_code:, name:, price:)
    @product_code = product_code
    @price = price
    @name = name
  end
end
