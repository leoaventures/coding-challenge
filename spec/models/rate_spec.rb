require "rails_helper"

RSpec.describe Rate, :type => :model do
  context "data validation" do
    it "requires an active carrier" do
      rate = Rate.new(destination: 'A', origin: 'B', rate: 20, currency: 'USD')
      expect(rate.valid?).to eq(false)

      c = Carrier.create(name: "test", shipping_rate: 10, currency: 'EUR')
      rate.carrier = c
      expect(rate.valid?).to eq(true)
    end
  end

  context "common currency" do
    it "converts EUR to common currency USD on save" do
      c = Carrier.create(name: "test", shipping_rate: 10, currency: 'EUR')
      rate = Rate.create(destination: 'A', origin: 'B', rate: 20, currency: 'EUR', carrier: c)
      expected_common_rate = Money.from_cents(rate.rate.to_f * 100, rate.currency).exchange_to("USD")
      expect(rate.common_rate).to eq(expected_common_rate.to_f)
    end
  end
end