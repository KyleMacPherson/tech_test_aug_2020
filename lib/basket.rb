class Basket
  attr_accessor :items

  def initialize
    @items = []
  end

  def add(item)
    @items << item
  end

  def total
    @items.map(&:price).sum
  end
end
