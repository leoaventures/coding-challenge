require "rails_helper"

RSpec.describe Carrier, :type => :model do
  context "common currency" do
    it "converts EUR to common currency USD on save" do
      c = Carrier.create(name: "test", shipping_rate: 10, currency: 'EUR')
      expected_common_rate = Money.from_cents(c.shipping_rate.to_f * 100, c.currency).exchange_to("USD")
      expect(c.common_rate).to eq(expected_common_rate.to_f)
    end
  end
end