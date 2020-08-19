class Checkout
  def initialize(promotions = [])
    @basket = Basket.new
    @promotions = promotions
  end

  def scan(item)
    @basket.add(item)
  end

  def total
    discount = @promotions.map { |promotion| promotion.discount_to_apply(@basket) }.sum
    total_in_pence = @basket.total - discount
    total_in_pence
    format_price(total_in_pence)
  end

  private

    def format_price(total_in_pence)
      '£%.2f' % (total_in_pence / 100.0)
    end
end
