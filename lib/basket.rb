# potential for validating items allowed in basket i.e can't buy more than X of Y
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
