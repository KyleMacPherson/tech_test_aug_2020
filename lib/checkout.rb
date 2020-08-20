class Checkout
  def initialize(promotions = [])
    @basket = Basket.new
    @promotions = promotions
  end

  def scan(item)
    @basket.add(item)
  end

  def total
    current_total = @basket.total
    @promotions.each do |promotion|
      discount = promotion.discount(basket: @basket, current_total: current_total)
      current_total -= discount
    end
    format_price(current_total)
  end

  private

    def format_price(total_in_pence)
      '£%.2f' % (total_in_pence / 100.0)
    end
end
