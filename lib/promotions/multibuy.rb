module Promotions
  class Multibuy
    def initialize(item:, required_number_of_items:, new_price:)
      @item = item
      @required_number_of_items = required_number_of_items
      @new_price = new_price
    end

    def discount(basket:, current_total:)
      quantity = basket.quantity(@item)
      if quantity >= @required_number_of_items
        (@item.price - @new_price) * quantity
      else
        0
      end
    end
  end
end
