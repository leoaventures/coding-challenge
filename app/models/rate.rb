class Rate < ApplicationRecord
    belongs_to :carrier
    monetize :price_cents

    validates :origin, presence: true
    validates :destination, presence: true
    validates :rate, presence: true
    validates :currency, presence: true
    validates :carrier_id, presence: true

    before_save :convert_rate_to_usd

    def common_rate
        self.price.to_f
    end

    private

    def convert_rate_to_usd
        usd_rate = Money.from_cents(self.rate.to_f * 100, self.currency).exchange_to("USD")
        self.price = usd_rate
    end
end