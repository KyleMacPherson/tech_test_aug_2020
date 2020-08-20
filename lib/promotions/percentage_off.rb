module Promotions
  class PercentageOff
    def initialize(required_total_spend:, discount_factor:)
      @required_total_spend = required_total_spend
      @discount_factor = discount_factor
    end

    def discount(basket:, current_total:)
      if basket.total > @required_total_spend
        current_total * @discount_factor
      else
        0
      end
    end
  end
end
