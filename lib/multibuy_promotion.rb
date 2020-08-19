# potential to create a multibuy promotion class that takes item code and discount per item

class MultibuyPromotion
  def initialize(item_code:, required_number_of_items:, discount_per_item:)
    @item_code = item_code
    @required_number_of_items = required_number_of_items
    @discount_per_item = discount_per_item
  end

  def discount_to_apply(basket)
    @number_of_items = basket.items.select { |item| item.product_code == @item_code }.count

    if @number_of_items >= @required_number_of_items
      @number_of_items * @discount_per_item
    else
      0
    end
  end
end
