# make test helper, loop through all files in lib and require here. google how to load all files in directory.
require 'checkout.rb'
require 'item.rb'
require 'basket.rb'
require 'lavender_hearts_multibuy_promotion.rb'
require 'ten_percent_off_over_sixty_pounds_promotion.rb'


describe Checkout do
  let(:heart) { Item.new(product_code: '001', name: 'Lavender heart', price: 925) }
  let(:cufflinks) { Item.new(product_code: '002', name: 'Personalised cufflinks', price: 4500) }
  let(:tshirt) { Item.new(product_code: '003', name: 'Kids t-shirt', price: 1995) }
  let(:checkout) { Checkout.new(promotions) }

  before do
    items.each do |item|
      checkout.scan(item)
    end
  end

  context 'no promotions to apply' do
    let(:items) { [heart, cufflinks, tshirt] }
    let(:promotions) { [] }

    it 'returns the basket total' do
      expect(checkout.total).to eq items.map(&:price).sum
    end
  end

  context 'all active promotions are applied' do
    let(:promotions) do
      [
        LavenderHeartsMultibuyPromotion.new,
        TenPercentOffOverSixtyPoundsPromo.new
      ]
    end

    context 'when basket contains items with codes `001`, `002`, and `003`' do
      let(:items) { [heart, cufflinks, tshirt] }

      it 'returns the basket total with promotional discounts applied' do
        expect(checkout.total).to eq 6678
      end
    end
  end
end
