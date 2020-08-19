#  could be struct
class Item
  attr_accessor :product_code, :name , :price

  def initialize(product_code:, name:, price:)
    @product_code = product_code
    @price = price
    @name = name
  end
end
