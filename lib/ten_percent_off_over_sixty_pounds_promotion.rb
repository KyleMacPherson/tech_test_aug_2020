class TenPercentOffOverSixtyPoundsPromo
  def discount_to_apply(basket)
    if basket.total > 6000
      basket.total * 0.1
    else
      0
    end
  end
end
