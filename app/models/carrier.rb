class Carrier < ApplicationRecord
    has_many :rates, dependent: :destroy
    monetize :price_cents

    before_save :convert_rate_to_usd

    def common_rate
        self.price.to_f
    end

    private

    def convert_rate_to_usd
        usd_rate = Money.from_cents(self.shipping_rate.to_f * 100, self.currency).exchange_to("USD")
        self.price = usd_rate
    end
end