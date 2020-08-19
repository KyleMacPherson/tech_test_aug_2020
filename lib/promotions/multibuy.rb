module Promotions
  class Multibuy
    def initialize(item_code:, required_number_of_items:, discount_per_item:)
      @item_code = item_code
      @required_number_of_items = required_number_of_items
      @discount_per_item = discount_per_item
    end

    def update_prices(basket)
      items_to_update = basket.items.select { |item| item.product_code == @item_code }

      if items_to_update.count >= @required_number_of_items
        items_to_update.each do |item|
          item.apply_discount(@discount_per_item)
        end
      end
    end
  end
end
