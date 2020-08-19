class Checkout
  def initialize(promotions = [])
    @basket = Basket.new
    @promotions = promotions
  end

  def scan(item)
    @basket.add(item)
  end

  def total
    @promotions.each { |promotion| promotion.update_prices(@basket) }
    format_price(@basket.total)
  end

  private

    def format_price(total_in_pence)
      '£%.2f' % (total_in_pence / 100.0)
    end
end
