# potential to create a multibuy promotion class that takes item code and discount per item

class LavenderHeartsMultibuyPromotion
  def discount_to_apply(basket)
    number_of_hearts = basket.items.select {|item| item.product_code == '001'}.count

    if number_of_hearts > 1
      number_of_hearts * 75
    else
      0
    end
  end
end
