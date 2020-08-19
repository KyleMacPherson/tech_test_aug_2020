class PercentageOffPromotion
  def initialize(required_total_spend:, discount:)
    @required_total_spend = required_total_spend
    @discount = discount
  end

  def discount_to_apply(basket)
    if basket.total > @required_total_spend
      basket.total * @discount
    else
      0
    end
  end
end
