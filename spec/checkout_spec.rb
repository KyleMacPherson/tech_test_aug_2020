require 'checkout.rb'
require 'item.rb'
require 'basket.rb'
require 'promotions/multibuy.rb'
require 'promotions/percentage_off.rb'
require 'byebug'

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
      expect(checkout.total).to eq "£74.20"
    end
  end

  context 'all active promotions are applied' do
    let(:promotions) do
      [
        Promotions::Multibuy.new(item_code: '001', required_number_of_items: 2, discount_per_item: 75),
        Promotions::PercentageOff.new(required_total_spend: 6000, discount: 0.1)
      ]
    end

    context 'when basket contains items with codes `001`, `002`, and `003`' do
      let(:items) { [heart, cufflinks, tshirt] }

      it 'returns the basket total with promotional discounts applied' do
        expect(checkout.total).to eq "£66.78"
      end
    end

    context 'when basket contains items with codes `001`, `001`, and `003`' do
      let(:items) { [heart, heart.dup, tshirt] }

      it 'returns the basket total with promotional discounts applied' do
        expect(checkout.total).to eq "£36.95"
      end
    end

    context 'when basket contains items with codes `001`, `001`, `002`, and `003`' do
      let(:items) { [heart, cufflinks, heart.dup, tshirt] }

      it 'returns the basket total with promotional discounts applied' do
        expect(checkout.total).to eq "£73.76"
      end
    end
  end
end
