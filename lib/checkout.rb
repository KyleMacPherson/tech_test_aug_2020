# should we have a service to apply promotions? A seperate file to store promotion rules in?
# looks like the github might want us to just enter a product code when scanning, should we have item directory in a separate file?
# lavender hearts

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
    # format_price(total_in_pence)
  end

  private

    def format_price(total_in_pence)
      "£#{(total_in_pence / 100.0).sig(2)}"
    end
end
