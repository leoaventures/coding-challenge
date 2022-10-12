# config/initializers/money.rb
MoneyRails.configure do |config|

    # set the default currency
    config.default_currency = :usd

    config.add_rate "USD", "EUR", 0.84663
    config.add_rate "EUR", "USD", 1.18115
end