class Basket
  def initialize
    @items = {}
  end

  def add(item)
    if @items[item]
      @items[item] = @items[item] + 1
    else
      @items[item] = 1
    end
  end

  def quantity(item)
    @items[item] || 0
  end

  def total
    @items.map { |item, quantity| item.price * quantity }.sum
  end
end
