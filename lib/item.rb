class Item
  attr_accessor :product_code, :name , :price

  def initialize(product_code:, name:, price:)
    @product_code = product_code
    @price = price
    @name = name
  end

  def apply_discount(discount_per_item)
    @price = @price - discount_per_item
  end
end
