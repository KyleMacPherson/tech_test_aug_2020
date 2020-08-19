module Promotions
  class PercentageOff
    def initialize(required_total_spend:, discount:)
      @required_total_spend = required_total_spend
      @discount = discount
    end

    def update_prices(basket)
      if basket.total > @required_total_spend
        basket.items.each do |item|
          item.apply_discount(item.price * @discount)
        end
      end
    end
  end
end
